namespace :aws_sqs_moniter do
  desc 'setup Aws SQS on your machicne.'
  task setup: :environment do
    puts "coping SQS config file for keeping AWS credentails"
  end

  task run_migrations: :environment do 
    puts "adding migrations to store/persist queue state/status."
  end
end
