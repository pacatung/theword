namespace :dev do
  desc "fake contact and message *10"
  task :fakeup => :environment do
    user = User.all.each do |u|
      10.times do |i|
        # user = User.create(:name => Faker::Name.name, :password => Devise.friendly_token[0,20], :email => Faker::Internet.email )
        u.contacts.create(:name => Faker::Name.name, :phone => Faker::PhoneNumber.phone_number, :email => Faker::Internet.email, :address => Faker::Address.street_address )
        u.messages.create(:content => Faker::Lorem.sentence(30))
      end

    end

  end

end
