class ChangeContactsFirst < ActiveRecord::Migration

  def change

    remove_column :receivers, :receiver_class
    remove_column :receivers, :relationship

    add_column :contacts, :relationship, :string
    add_column :contacts, :relationship_color_class, :string
    add_column :contacts, :check_alive, :boolean, :default => true

  end

end
