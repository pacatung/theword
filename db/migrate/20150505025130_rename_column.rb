class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :receivers, :is_contact, :receiver_class
    change_column :receivers, :receiver_class, :string
  end
end
