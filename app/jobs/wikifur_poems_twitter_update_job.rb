class WikifurPoemsTwitterUpdateJob < ActiveJob::Base

  include Twittable

  queue_as :default

  def consumer_key
    ENV["WIKIFUR_POEMS_ACCESS_TOKEN_KEY"]
  end  

  def consumer_secret
    ENV["WIKIFUR_POEMS_ACCESS_TOKEN_SECRET"]
  end

  def message
    Stanza.new(
      rhymes_scheme: [:enclosed, :alternate].sample,
      feet_count: 6
    )
  end

end

