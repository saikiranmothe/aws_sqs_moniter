class CreateDeadLetters < ActiveRecord::Migration
  def change
    create_table :dead_letters, id: false do |t|
      t.timestamps

      t.string :sqs_id, null: false, index:  { unique: true }
      t.string	 :message_id, null: false, index: true
      t.string :message, null: false
    end
  end
end
