require 'aws_sqs_moniter/middleware/server/airbrake'
require 'aws_sqs_moniter/middleware/server/active_record/connection_pool'
require 'aws_sqs_moniter/middleware/server/active_record/transaction'

module AwsSqsMoniter
  module DeadLetters
    class Worker
      include Shoryuken::Worker

      shoryuken_options(
        auto_delete: true,
        body_parser: :json,
        subscriptions: {
          financials_dlq: '*' })

      server_middleware do |chain|
        chain.remove Middleware::Server::Airbrake
        chain.add Middleware::Server::ActiveRecord::ConnectionPool
        chain.add Middleware::Server::ActiveRecord::Transaction, isolation: :repeatable_read
      end

      def perform sqs_message, payload
        typed_message = TypedMessage.new sqs_message

        return if DeadLetter.exists? message_id: typed_message.id

        DeadLetter.create!(
          sqs_id: sqs_message.message_id,
          message_id: typed_message.id,
          message: payload)
      end
    end
  end
end
