# bin/rake checker:facebook
namespace :checker do

  task :facebook => :environment do

    User.find_each do |u|

      u.check_facebook!

    end

  end

end