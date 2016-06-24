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
    rhymes_scheme = [:enclosed, :alternate].sample
    Stanza.new(rhymes_scheme: rhymes_scheme, feet_count: 6)
  end

end

