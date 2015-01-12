class CreateDeadLetters < ActiveRecord::Migration
  def change
    create_table :dead_letters, id: false do |t|
      t.timestamps

      t.string :sqs_id, null: false, index:  { unique: true }
      t.string	 :message_id, null: false, index: true
      t.string :message, null: false

      t.string :topic, null: false

      t.integer :attempts, null: false, default: 0
      t.datetime :attempted_at

      t.string :processed_by
      t.datetime :processed_at
    end
  end
end
