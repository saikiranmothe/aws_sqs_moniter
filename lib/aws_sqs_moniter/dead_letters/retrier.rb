module AwsSqsMoniter
  module DeadLetters
    class Retrier
      def initialize logger = nil
        @publisher = AwsSqsMoniter::MessagePublisher.new
        @logger = logger || Shoryuken::Logging.logger
      end

      def retry scope
        return if scope.count == 0

        count = 0
        scope.each do |message|
          count += 1
          @publisher.publish message.message
          message.delete
        end

        @logger.info "Retried #{count} dead letter(s)."
      end
    end
  end
end
