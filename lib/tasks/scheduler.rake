require 'rake'
desc "Oncoming event reminder"
task :protest_reminder => :environment do
  UserMailer.notification("kunz5@uci.edu").deliver_now
end