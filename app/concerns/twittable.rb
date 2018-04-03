module Twittable

  def twitter_client
    Twitter::REST::Client.new do |config|
      config.access_token = ENV["TWITTER_API_KEY"],
      config.access_token_secret = ENV["TWITTER_API_SECRET"],
      config.consumer_key = ENV["TWITTER_APP_ACCESS_TOKEN_KEY"],
      config.consumer_secret = ENV["TWITTER_APP_ACCESS_TOKEN_SECRET"]
    end
  end

end