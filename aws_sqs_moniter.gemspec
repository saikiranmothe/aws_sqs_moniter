# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aws_sqs_moniter/version'

Gem::Specification.new do |spec|
  spec.name          = "aws_sqs_moniter"
  spec.version       = AwsSqsMoniter::VERSION
  spec.authors       = ["saikiranmothe"]
  spec.email         = ["saikiran.mothe@gmail.com"]
  spec.summary       = %q{AWS SQS Moniter}
  spec.description   = %q{AWS SQS Moniter.}
  spec.homepage      = "http://saikiranmothe.github.io/aws_sqs_moniter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency 'retryable'
  spec.add_runtime_dependency 'shoryuken'

  spec.add_development_dependency 'awesome_print'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-minitest'
  spec.add_development_dependency 'guard-rubocop'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'minitest-focus'
  spec.add_development_dependency 'minitest-rg'
  spec.add_development_dependency 'mocha'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake'
end
