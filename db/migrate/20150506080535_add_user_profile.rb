class AddUserProfile < ActiveRecord::Migration
  def change
    add_column :users, :home_phone, :string
    add_column :users, :address, :string
    add_column :users, :active_date, :date
    add_column :users, :status, :string
  end
end
