module AwsSqsMoniter
  module Aws
    class Arns
      def sns_arn
        if AwsSqsMoniter.configuration.sns_protocol == 'cqs'
          "arn:cmb:cns:ccp:#{AwsSqsMoniter.configuration.aws_account_id}"
        else
          "arn:aws:sns:#{AwsSqsMoniter.configuration.aws_region}:#{AwsSqsMoniter.configuration.aws_account_id}"
        end
      end

      def sns_topic_arn topic
        "#{sns_arn}:#{topic}"
      end

      def sqs_arn
        if AwsSqsMoniter.configuration.sqs_protocol == 'cqs'
          "arn:cmb:cqs:ccp:#{AwsSqsMoniter.configuration.aws_account_id}"
        else
          "arn:aws:sqs:#{AwsSqsMoniter.configuration.aws_region}:#{AwsSqsMoniter.configuration.aws_account_id}"
        end
      end

      def sqs_queue_arn queue
        "#{sqs_arn}:#{queue}"
      end
    end
  end
end
