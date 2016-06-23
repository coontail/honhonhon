module Twittable

  def consumer_key;end       ### Must be imperatively overriden ###

  def consumer_secret;end    ### Must be imperatively overriden ###

  def message;end            ### Must be imperatively overriden ###

  def get_twitter_client
    Twitter::REST::Client.new do |config|
      config.access_token = ENV["TWITTER_API_KEY"]
      config.access_token_secret = ENV["TWITTER_API_SECRET"]
      config.consumer_key = consumer_key 
      config.consumer_secret = consumer_secret 
    end
  end

  def perform
    client = get_twitter_client
    client.update(message)
  end

end