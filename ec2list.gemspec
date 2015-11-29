# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ec2list/version'

Gem::Specification.new do |spec|
  spec.name          = "ec2list"
  spec.version       = Ec2list::VERSION
  spec.authors       = ["Masato Ikeda"]
  spec.email         = ["masato.ikeda@gmail.com"]
  spec.summary       = %q{Show running instances on AWS EC2.}
  spec.description   = %q{Show running instances on AWS EC2.}
  spec.homepage      = "https://github.com/a2ikm/ec2list"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "aws_config"
  spec.add_runtime_dependency "aws-sdk", "~> 1.0"
  spec.add_runtime_dependency "slop", "~> 3.0"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
