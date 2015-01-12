require 'awesome_print'
require 'minitest/autorun'
require 'minitest/focus'
require 'minitest/rg'
require 'minitest/spec'
require 'mocha/mini_test'
require 'pry-byebug'
require 'aws_sqs_moniter'

module ActiveRecord
  RecordNotUnique = Class.new StandardError
  StatementInvalid = Class.new StandardError

  class Base
    def self.transaction opts
    end
  end
end
