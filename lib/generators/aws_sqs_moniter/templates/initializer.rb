# Load any middlewares you want to use:
#
# require 'aws_sqs_moniter/middleware/server/airbrake'
# require 'aws_sqs_moniter/middleware/server/active_record/connection_pool'

# Configure your environment:
#
# AwsSqsMoniter.configure do |config|
#   config.use_aws_sqs_moniter_logging
#   config.use_typed_message_registry 'your_dead_letter_queue_name'

#   if Rails.env.development?
#     config.enable_cmb_mode
#     config.require_application_workers
#     config.require_dead_letter_worker
#   end

#   config.queue_defaults.delay_seconds = 0
#   config.queue_defaults.message_retention_period = 1_209_600
#   config.queue_defaults.visibility_timeout = 30

#   config.add_queue('your_dead_letter_queue_name') do |queue|
#     queue.visibility_timeout = 60
#   end

#   config.add_queue('your_queue_name') do |queue|
#     queue.delay_seconds = 10
#     queue.redrive_policy.dead_letter_queue = 'your_dead_letter_queue_name'
#     queue.redrive_policy.enabled = true
#     queue.redrive_policy.max_receive_count = 5
#   end
# end
