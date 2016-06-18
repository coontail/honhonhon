class ReadWikipediaJob < ActiveJob::Base

	include WebsiteReadable

  queue_as :default

  def extract_text_from(link)
  	parse(link).css("p")[0].text
  end

end
