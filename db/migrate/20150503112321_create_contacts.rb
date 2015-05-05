class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :home_phone
      t.string :email
      t.string :address
      t.integer :user_id, :index => true
      t.timestamps null: false
    end
  end
end
