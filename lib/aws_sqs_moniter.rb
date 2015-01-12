require 'shoryuken'
require 'aws_sqs_moniter/version'
require 'aws_sqs_moniter/logging'
require 'aws_sqs_moniter/configuration'
require 'aws_sqs_moniter/railtie' if defined? Rails

module AwsSqsMoniter
  class << self
    def configure
      @config ||= Configuration.new.tap do |config|
        yield config
        config.validate!
      end
    end

    def configuration
      fail 'You must call AwsSqsMoniter .configure in an initializer.' unless @config
      @config
    end

    def sns_client
      ::Aws::SNS::Client.new configuration.sns_options
    end

    def sqs_client
      ::Aws::SQS::Client.new configuration.sqs_options
    end
  end
end
