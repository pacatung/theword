class Receiver < ActiveRecord::Base
  belongs_to :contact
  has_many :messages
end
