module Daikon
  class Client
    include NamespaceTools

    EXCEPTIONS = [Timeout::Error,
                  Errno::EINVAL,
                  Errno::ECONNRESET,
                  EOFError,
                  JSON::ParserError]

    attr_accessor :redis, :logger, :config, :http, :monitor

    def setup(config, logger = nil)
      self.config  = config
      self.logger  = logger
      self.redis   = connect
      self.monitor = Monitor.new(connect, logger)
      self.http    = Excon.new(config.server_prefix)

      log "Started Daikon v#{VERSION}"
    end

    def connect
      Redis.new(:host => config.redis_host, :port => config.redis_port)
    end

    def start_monitor
      monitor.start
    end

    def log(message)
      logger.info message if logger
    end

    def request(method, path, options = {})
      options[:method]  = method.to_s.upcase
      options[:path]    = path
      options[:headers] ||= {}
      options[:headers]['Authorization'] = config.api_key

      log "#{options[:method]} #{config.server_prefix}/#{options[:path]}"
      http.request(options)
    end

    def push(method, path, body)
      json = body.to_json
      request(method, path,
                   :body    => json,
                   :headers => {"Content-Length" => json.size.to_s,
                                "Content-Type"   => "application/json"})
    end

    def fetch_commands
      raw_commands = request(:get, "/api/v1/commands.json")
      commands = JSON.parse(raw_commands.body)

      commands.each do |id, command|
        result = evaluate_redis(command)
        pretty = StringIO.new
        PP.pp(result, pretty)

        push :put, "/api/v1/commands/#{id}.json", {"response" => pretty.string.strip}
      end
    rescue *EXCEPTIONS => ex
      log ex.to_s
    end

    def rotate_monitor
      payload = {
        "data" => monitor.rotate,
        "info" => redis.info
      }

      push :post, "/api/v1/summaries.json", payload
    rescue *EXCEPTIONS => ex
      log ex.to_s
    end

    def evaluate_redis(command)
      # Attempt to parse the given command string.
      argv =
        begin
          Shellwords.shellwords(command.to_s)
        rescue Exception => e
          STDERR.puts e.message
          e.backtrace.each {|bt| STDERR.puts bt}
          return e.message
        end
      return "No command received." unless argv[0]

      begin
        execute_redis(argv)
      rescue Exception => e
        STDERR.puts e.message
        e.backtrace.each {|bt| STDERR.puts bt}
        e.message
      end
    end

    def namespace
      nil
    end

    def execute_redis(argv)
      # Apply the current namespace to any fields that need it.
      argv = namespace_input(namespace, *argv)

      raise "Not a Redis command." unless argv.kind_of? Array

      # Send the command to Redis.
      result = redis.send(*argv)

      # Remove the namespace from any commands that return a key.
      denamespace_output namespace, argv.first, result
    end
  end
end
