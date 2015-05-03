class CreateReceivers < ActiveRecord::Migration
  def change
    create_table :receivers do |t|
      t.integer :message_id, :index => true
      t.integer :contact_id, :index => true
      t.timestamps null: false
    end
  end
end
