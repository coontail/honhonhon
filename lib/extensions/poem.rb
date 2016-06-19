class Poem

  def build_short_poem
    verses = 
      2.times.map do
        word = get_random_rhyming_word
        [build_verse_from(word, 6), build_verse_from(word.rhyming_words.sample, 6)]      
      end

    rhyming_couplets = 
      verses.each_cons(2).map do |couplet_a, couplet_b| 
        couplet_a.zip(couplet_b)
      end

    rhyming_couplets.flatten.join(",\n")
  rescue
    retry
  end

  def build_verse_from(rhyming_word, feet_count=12)
    sentence = [rhyming_word]
    counter = feet_count - rhyming_word.syllables_count

    until counter == 0 do
      word = sentence.last.preceding_words.where("syllables_count <= ?", counter).sample

      raise NoRhymesError unless word.present?

      sentence << word
      counter -= sentence.last.syllables_count
    end

    sentence.flatten.map(&:value).reverse.join(" ").capitalize
  end

  def get_random_rhyming_word
    Word.all.sample(100).detect{ |word| word.rhyming_words.any? }
  end

end


