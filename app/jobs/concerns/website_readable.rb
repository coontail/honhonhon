require "open-uri"

module WebsiteReadable

	def perform(link)
		text = extract_text_from(link)
		words = sanitize(text).split.map(&:strip)

		words.each_cons(2) do |word, following_word|
			word = Word.find_or_create_by(value: word)
			following_word = Word.find_or_create_by(value: following_word)

			create_word_relation(word, following_word)
		end

    WordsCleanJob.perform_now
	end
  
	def create_word_relation(word, following_word)
		Word.transaction do
	  	relation = word.following_word_relations.find_or_create_by(following_word: following_word)
	  	update_relation_counter(relation)
	  end
	end

  def update_relation_counter(relation)
    relation.update(occurence_counter: relation.occurence_counter + 1)
  end

  def extract_text_from(link)
    parse(link).css("p").try(:text).to_s
  end

  def parse(link)
    Nokogiri.parse(open(link).read)
  end
  
  def sanitize(text)
    CGI.unescapeHTML(text).gsub(/[^\-\'\s\p{Alnum}]/,' ').squeeze(' ').downcase
  end

end