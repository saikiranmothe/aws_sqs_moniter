require 'rails'

module AwsSqsMoniter
  class Railtie < Rails::Railtie
    rake_tasks do
      load File.expand_path('../../tasks/aws_sqs_moniter.rake', __FILE__)
    	load File.expand_path('../../tasks/aws_sqs_install.rake', __FILE__)
    end
  end
end
