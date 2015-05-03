class CreateReceivers < ActiveRecord::Migration
  def change
    create_table :receivers do |t|
      t.integer :message_id, null: false, :index => true
      t.integer :contact_id, null: false, :index => true
      t.boolean :is_contact, null: false, :default => false
      t.timestamps null: false
    end
  end
end
