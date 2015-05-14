class HasAttachedFileToMessages < ActiveRecord::Migration
  def change
    add_attachment :messages, :audio
    add_attachment :messages, :video
  end
end
