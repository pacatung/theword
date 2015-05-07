class Contact < ActiveRecord::Base
  belongs_to :user
  has_many :messages, :through => :receivers
  validates_presence_of :name, :phone, :email
end
