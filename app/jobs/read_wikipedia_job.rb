class ReadWikipediaJob < ReadWebsiteJob

  def extract_text_from(link)
    parse(link).css("p")[3].try(:text).to_s
  end

end
