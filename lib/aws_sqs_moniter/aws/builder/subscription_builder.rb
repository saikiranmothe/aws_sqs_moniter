module AwsSqsMoniter
  module Aws
    class Builder
      class SubscriptionBuilder
        def initialize logger, queue
          @logger = logger
          @queue = queue
          @arns = Arns.new
          @sns = AwsSqsMoniter.sns_client
          @sqs = AwsSqsMoniter.sqs_client
        end

        def build
          queue_url = @sqs.get_queue_url(queue_name: @queue)[:queue_url]

          queue_arn = @sqs.get_queue_attributes(
            queue_url: queue_url,
            attribute_names: ['QueueArn']).attributes['QueueArn']

          topics.each do |topic|
            topic = EnvironmentalName.new(topic).to_s
            topic_arn = @arns.sns_topic_arn topic

            if AwsSqsMoniter.configuration.sns_protocol == 'cqs'
              @sns.add_permission topic_arn: topic_arn,
                                  label: "subscribe-#{AwsSqsMoniter.configuration.aws_account_id}-#{Time.now.strftime('%Y%m%d%H%M%S')}",
                                  aws_account_id: [AwsSqsMoniter.configuration.aws_account_id],
                                  action_name: ['Subscribe']
            end

            @logger.info subscribing_queue: @queue, subscription_topic: topic

            @sns.subscribe(
              endpoint: queue_arn,
              protocol: AwsSqsMoniter.configuration.sns_protocol,
              topic_arn: topic_arn)
          end
        end

        private

        def topics
          Shoryuken.worker_registry.topics(@queue)
        end
      end
    end
  end
end
