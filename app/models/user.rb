class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :contacts, :dependent => :destroy
  has_many :messages, :dependent => :destroy

  validates_inclusion_of :status, :in => ["live", "die", "sent"]

  def check_facebook!
    #conn = Faraday.new(:url => 'https://graph.facebook.com/me')
    #response1 = conn.get "/me", { :access_token => self.fb_token }
    #data1 = JSON.parse(response.body)

    conn = Faraday.new(:url => 'https://graph.facebook.com')
    response2 = conn.get "/#{self.uid}/posts", { :access_token => self.fb_token }
    data2 = JSON.parse(response2.body)

    if data2["data"].first
      t = Time.parse( data2["data"].first["created_time"] )
      self.active_date = t
      self.save
      puts "User #{self.id} is active at #{t}"
    end

  end

  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end

    user.fb_token = auth[:credentials][:token]
    user.fb_expires_at = Time.at(auth[:credentials][:expires_at])
    user.save!
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
