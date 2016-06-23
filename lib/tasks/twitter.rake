namespace :twitter do
  
  desc "Updates wikifur poems twitter feed"
  task :update_wikifur_poems => :environment do
    WikifurPoemsTwitterUpdateJob.perform_now
  end

end