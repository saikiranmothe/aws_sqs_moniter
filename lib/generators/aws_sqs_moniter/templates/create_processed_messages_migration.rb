class CreateProcessedMessages < ActiveRecord::Migration
  def change
    create_table :processed_messages, id: :uuid do |t|
      t.timestamps

      t.string :message_id, null: false
      t.string :queue, null: false
      t.string :message, null: false
      
      t.string :topic, null: false

      t.integer :attempts, null: false, default: 0
      t.datetime :attempted_at

      t.string :processed_by
      t.datetime :processed_at

      t.index %i(message_id queue), unique: true
    end
  end
end
