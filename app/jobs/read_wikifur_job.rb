class ReadWikifurJob < ActiveJob::Base

	include WebsiteReadable

  queue_as :default

  def extract_text_from(link)
  	parse(link).css("p").try(:text).to_s
  end

end
