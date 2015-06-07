# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'doting/version'

Gem::Specification.new do |spec|
  spec.name = 'Doting'
  spec.version = Doting::VERSION
  spec.author = %q{Gaelan D'costa}
  spec.email = 'gdcosta@gmail.com'

  spec.summary = 'Yet another dotfile manager'
  spec.description = <<-EOL
    Doting is a utility and configuration format for managing a user's dotfiles.

    A user can, with a single command, safely install their preferred
    unix configuration, given a configuration which specifies the source
    of each configuration file and optionally some environment-specific
    content for things like work-specific configuration.

    It was written not for any great reason, but because it would be more
    beneficial in the author's mind for itself to write a new project than
    reuse any of the fine already-built choices out there on the internet.
  EOL
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = %w{lib}

  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'aruba', '~> 0.6'
  spec.add_development_dependency 'rspec', '~> 3.2.0'

  spec.add_dependency 'erubis', '~> 2.7.0'
end
