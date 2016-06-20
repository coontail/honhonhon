class Stanza

  attr_accessor :verses

  def initialize(options = {})
    @verses = []
    @feet_count = options[:feet_count] || 12
    @rhymes_format = options[:rhymes_format] || :embraced

    build_with_rhymes_format
  end

  def build_with_rhymes_format
    case @rhymes_format
    when :embraced then build_with_embraced_rhymes
    end
  end

  def build_with_embraced_rhymes
    rhyming_word = Word.get_random_rhyming_word
    verse_a = Verse.new(base_word: rhyming_word, feet_count: @feet_count)
    verse_b = Verse.new(base_word: rhyming_word.rhyming_words.sample, feet_count: @feet_count)

    rhyming_word = Word.get_random_rhyming_word
    verse_c = Verse.new(base_word: rhyming_word, feet_count: @feet_count)
    verse_d = Verse.new(base_word: rhyming_word.rhyming_words.sample, feet_count: @feet_count)

    @verses = [verse_a, verse_c, verse_d, verse_b]
  end

  def to_s
    @verses.map(&:to_s).join(",\n")
  end

end