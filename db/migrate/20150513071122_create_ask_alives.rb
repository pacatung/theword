class CreateAskAlives < ActiveRecord::Migration
  def change
    create_table :ask_alives do |t|
      t.integer :contact_id
      t.integer :user_id
      t.string :token
      t.string :status, null: false, :default => "pending"
      t.timestamps null: false
    end
    change_column :users, :fb_token, :text
  end
end
