class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id, null: false
      t.text :content
      t.date :delivery_date
      t.string :status, null: false, :default => "final"
      t.timestamps null: false
    end
  end
end
