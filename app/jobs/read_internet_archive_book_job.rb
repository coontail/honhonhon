class ReadInternetArchiveBookJob < ReadWebsiteJob

  def extract_text_from(link)
    parse(link).css("pre").try(:text).to_s
  end

end
