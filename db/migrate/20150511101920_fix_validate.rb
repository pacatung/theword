class FixValidate < ActiveRecord::Migration
  def change
    change_column :users, :status, :string, null: false, :default => "live"
    change_column :contacts, :email, :string, null: false
  end
end

