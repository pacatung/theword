class EditPhone < ActiveRecord::Migration
  def change
    change_column :contacts, :phone, :string
    change_column :contacts, :home_phone, :string
  end
end
