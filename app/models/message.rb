class Message < ActiveRecord::Base
  belongs_to :user
  has_many :receivers
  has_many :contacts, :through => :receivers
end
