# bin/rake checker:facebook
namespace :checker do

  task :facebook => :environment do
    User.find_each do |u|
      u.check_facebook!
    end
  end

  task :ask_alive => :environment do
    User.where( [ "active_date < ?" , Date.today ] ).each { |u|
        UserMailer.ask_user(u).deliver_now!
        UserMailer.ask_contacts(u).deliver_now!
    }
  end

  task :send_theword => :environment do
    User.where( :status => "dead"). find_each do |u|
      u.send_theword!
    end
  end

end