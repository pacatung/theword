class Message < ActiveRecord::Base
  belongs_to :user
  has_many :receivers, :dependent => :destroy
  has_many :contacts, :through => :receivers

  def create_message_notify

    UserMailer.notify_comment(self.user, self).deliver_later!

  end
end
