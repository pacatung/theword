class Message < ActiveRecord::Base
  belongs_to :user
  has_many :receivers, :dependent => :destroy
  has_many :contacts, :through => :receivers

  validates_presence_of :content
  before_save :draft_or_final

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def create_message_notify

    UserMailer.notify_comment(self.user, self).deliver_later!

  end

  protected

  def draft_or_final
    if self.status == "final" && self.receivers.empty?
      self.status = "draft"
    end
  end

end