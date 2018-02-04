namespace :twitter do

  desc "Updates wikifur poems twitter feed"
  task :tweet_poem => :environment do
    TweetPoemJob.perform_now
  end

end