# bin/rake checker:facebook
namespace :checker do

  task :facebook => :environment do

    User.find_each do |u|

      u.check_facebook!

    end

  end

  task :ask_alive => :environment do

    u = User.first

    if u.active_date < (Date.today - 1)
      UserMailer.ask_user(u).deliver_now!
      UserMailer.ask_contacts(u).deliver_now!
    end

  end

  task :send_theword => :environment do
    u = User.first
    if u.status == "die"
      u.messages.each do |m|
        if m.status == "final"
          m.receivers.each do |r|
            UserMailer.send_theword(m,r).deliver_now!
          end
        end
      end
    end

  end

end