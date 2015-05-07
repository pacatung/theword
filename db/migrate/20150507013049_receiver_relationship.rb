class ReceiverRelationship < ActiveRecord::Migration
  def change
    add_column :receivers, :relationship, :string
  end
end
