module AwsSqsMoniter
  module Middleware
    module Server
      module ActiveRecord
        class Idempotence
          def initialize logger: Shoryuken::Logging.logger
            @logger = logger
          end

          def call _worker, queue, sqs_msg, _body
            message = TypedMessage.new sqs_msg

            if ProcessedMessage.exists? message_id: message.id, queue: queue
              @logger.info middleware: 'idempotence', ignored_message_id: message.id
            else
              yield
              ProcessedMessage.log message
            end
          end
        end
      end
    end
  end
end
