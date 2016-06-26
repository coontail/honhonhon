class ReadWikipediaJob < ActiveJob::Base

  include WebsiteReadable

  queue_as :default

  def extract_text_from(page)
    page.css("p")[3].try(:text).to_s
  end

end
