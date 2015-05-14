class AskAlive < ActiveRecord::Base
  belongs_to :user
  belongs_to :contact
  before_validation :generate_token, :update_active

  def generate_token
    self.token = SecureRandom.hex(20)
  end

  def update_active
    # self.user.active_date = Date.today if self.status = "alive"
  end

end
