require './lib/daikon/version'

Gem::Specification.new do |s|
  s.name = %q{daikon}
  s.version = Daikon::VERSION

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nick Quaranto"]
  s.date = %q{2011-03-25}
  s.default_executable = %q{daikon}
  s.description = %q{daikon, a radishapp.com client}
  s.email = %q{nick@quaran.to}
  s.executables = ["daikon"]
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "MIT-LICENSE",
    "README.rdoc",
    "Rakefile",
    "bin/daikon",
    "daikon.gemspec",
    "lib/daikon.rb",
    "lib/daikon/client.rb",
    "lib/daikon/configuration.rb",
    "lib/daikon/daemon.rb",
    "lib/daikon/daemons_hacks.rb",
    "lib/daikon/monitor.rb",
    "lib/daikon/redis_hacks.rb",
    "spec/client_spec.rb",
    "spec/configuration_spec.rb",
    "spec/daemon_spec.rb",
    "spec/monitor_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/qrush/daikon}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{daikon, a radishapp.com client}
  s.test_files = [
    "spec/client_spec.rb",
    "spec/configuration_spec.rb",
    "spec/daemon_spec.rb",
    "spec/monitor_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<daemons>, ["= 1.1.0"])
      s.add_runtime_dependency(%q<excon>, ["= 0.5.6"])
      s.add_runtime_dependency(%q<json_pure>, ["= 1.4.6"])
      s.add_runtime_dependency(%q<redis>, ["= 2.1.1"])
      s.add_development_dependency(%q<bourne>, [">= 0"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<timecop>, [">= 0"])
    else
      s.add_dependency(%q<daemons>, ["= 1.1.0"])
      s.add_dependency(%q<excon>, ["= 0.5.6"])
      s.add_dependency(%q<json_pure>, ["= 1.4.6"])
      s.add_dependency(%q<redis>, ["= 2.1.1"])
      s.add_dependency(%q<bourne>, [">= 0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<timecop>, [">= 0"])
    end
  else
    s.add_dependency(%q<daemons>, ["= 1.1.0"])
    s.add_dependency(%q<excon>, ["= 0.5.6"])
    s.add_dependency(%q<json_pure>, ["= 1.4.6"])
    s.add_dependency(%q<redis>, ["= 2.1.1"])
    s.add_dependency(%q<bourne>, [">= 0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<timecop>, [">= 0"])
  end
end

