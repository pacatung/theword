namespace :dev do
  desc "fake contact and message *10"
  task :fakeup => :environment do
  # task :fakeup =>%w[db:schema:load environment] do
    relation = ["媽媽" "爸爸" "哥哥" "姐姐" "弟弟" "妹妹" "姨丈" "老師" "朋友" "死黨" "老婆" "小三" "一夜情對象" "兒子" "女兒" "孫子" "媳婦"]

    User.all.each do |u|
      10.times do |i|
        # user = User.create(:name => Faker::Name.name, :password => Devise.friendly_token[0,20], :email => Faker::Internet.email )
        u.contacts.create(:name => Faker::Name.name, :phone => Faker::PhoneNumber.phone_number,
         :email => Faker::Internet.email, :address => Faker::Address.street_address, :relationship => relation.sample(1) )
      end

      5.times do |i|
        u.messages.create(:content => Faker::Lorem.sentence(30), :contact_ids => u.contacts.sample(3).map{|c| c.id},
         :delivery_date => "2020/9/17", :status => ["draft" "final"].sample(1))
         # :relationship => relation.sample(1)
      end

    end

  end

end
