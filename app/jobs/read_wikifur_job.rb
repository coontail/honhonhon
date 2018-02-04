class ReadWikifurJob < ReadWebsiteJob

  def extract_text_from(link)
    parse(link).css("p").try(:text).to_s
  end

end
