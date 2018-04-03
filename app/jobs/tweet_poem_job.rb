class TweetPoemJob < ActiveJob::Base

  include Twittable

  queue_as :default

  def perform
    twitter_client.update(message)
  end

  private

  def message
    Poem.new(format: :short)
  end

end

