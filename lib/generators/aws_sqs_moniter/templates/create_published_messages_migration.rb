class CreatePublishedMessages < ActiveRecord::Migration
  def change
    create_table :published_messages, id: :uuid do |t|
      t.timestamps

      t.string :topic, null: false
      t.string :message, null: false
      t.string :response
      t.string :sqs_id, null: false, index:  { unique: true }
      t.string   :message_id, null: false, index: true
     
      t.integer :attempts, null: false, default: 0
      t.datetime :attempted_at

      t.string :published_by
      t.datetime :published_at

      t.index :published_by
      t.index :published_at
    end
  end
end
