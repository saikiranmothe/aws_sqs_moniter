require 'rails/generators/named_base'
require 'rails/generators/active_record/migration'

module AwsSqsMoniter
  class InstallGenerator < Rails::Generators::Base
    include ActiveRecord::Generators::Migration

    desc 'Installs models and initializers to Rails Application'

    source_root File.expand_path('../templates', __FILE__)

    def install_files
      #copiong initializer to config/intializer of rails application
      copy_file 'initializer.rb', 'config/initializers/aws_sqs_moniter_intializer.rb'
      copy_file 'dead_letter.rb', 'app/models/dead_letter.rb'
      copy_file 'processed_message.rb', 'app/models/processed_message.rb'
      copy_file 'published_message.rb', 'app/models/published_message.rb'
      #coping aws config file to  rails application
      copy_file 'shoryuken.yml' , 'config/shoryuken.yml'
      migration_template 'create_dead_letters_migration.rb',
                         'db/migrate/create_dead_letters.rb'

      migration_template 'create_processed_messages_migration.rb',
                         'db/migrate/create_processed_messages.rb'

      migration_template 'create_published_messages_migration.rb',
                         'db/migrate/create_published_messages.rb'
    end
  end
end
