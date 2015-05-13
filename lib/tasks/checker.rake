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
    User.each do |u|
      if u.status == "die"
        u.messages.where( :status => "final").each do |m|
          m.receivers.each do |r|
            UserMailer.send_theword(m,r).deliver_now!
          end
        end
        u.status = "sent"
      end
    end
  end

end