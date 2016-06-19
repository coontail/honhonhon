class ReadWikipediaJob < ActiveJob::Base

  include WebsiteReadable

  queue_as :default

  def extract_text_from(link)
    parse(link).css("p")[2].try(:text).to_s
  end

end
