# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{daikon}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nick Quaranto"]
  s.date = %q{2010-11-19}
  s.default_executable = %q{daikon}
  s.description = %q{daikon, a radishapp.com client}
  s.email = %q{nick@quaran.to}
  s.executables = ["daikon"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "bin/daikon",
    "daikon.gemspec",
    "features/daikon.feature",
    "features/step_definitions/daikon_steps.rb",
    "features/support/env.rb",
    "lib/daikon.rb",
    "lib/daikon/client.rb",
    "lib/daikon/configuration.rb",
    "lib/daikon/daemon.rb",
    "lib/daikon/namespace_tools.rb",
    "spec/client_spec.rb",
    "spec/configuration_spec.rb",
    "spec/daikon_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/qrush/daikon}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{daikon, a radishapp.com client}
  s.test_files = [
    "spec/client_spec.rb",
    "spec/configuration_spec.rb",
    "spec/daikon_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<daemons>, ["~> 1.0.0"])
      s.add_runtime_dependency(%q<redis>, ["~> 2.1.1"])
      s.add_runtime_dependency(%q<system_timer>, ["= 1.0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.1.0"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.1"])
    else
      s.add_dependency(%q<daemons>, ["~> 1.0.0"])
      s.add_dependency(%q<redis>, ["~> 2.1.1"])
      s.add_dependency(%q<system_timer>, ["= 1.0"])
      s.add_dependency(%q<rspec>, ["~> 2.1.0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.1"])
    end
  else
    s.add_dependency(%q<daemons>, ["~> 1.0.0"])
    s.add_dependency(%q<redis>, ["~> 2.1.1"])
    s.add_dependency(%q<system_timer>, ["= 1.0"])
    s.add_dependency(%q<rspec>, ["~> 2.1.0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.1"])
  end
end

