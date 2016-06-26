require "open-uri"

module WebsiteReadable

  include WordRelationable

  def perform(link)
    page = parse(link)

    return unless page.present?

    text = extract_text_from(page)
    words = sanitize(text).split.map(&:strip)

    words.each_cons(2) do |word, following_word|
      word = Word.find_or_create_by(value: word)
      following_word = Word.find_or_create_by(value: following_word)

      create_word_relation(word, following_word)
    end

    WordsCleanJob.perform_now
  end

  def extract_text_from(page)
    page.css("p").try(:text).to_s
  end

  def sanitize(text)
    CGI.unescapeHTML(text).gsub(/[^\-\'\s\p{Alnum}]/,' ').squeeze(' ').downcase
  end

  def parse(link)
    Nokogiri.parse(open(link).read)
  rescue OpenURI::HTTPError
    nil
  end
  
end