class Contact < ActiveRecord::Base

  belongs_to :user
  has_many :receivers, :dependent => :destroy
  has_many :messages, :through => :receivers
  has_many :ask_alives
  validates_presence_of :name, :phone, :email

  scope :only_check_alive, ->{ where(:check_alive => true) }

end