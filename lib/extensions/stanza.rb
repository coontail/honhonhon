class Stanza

  attr_accessor :verses

  def initialize(options = {})
    @feet_count = options[:feet_count] || 12
    @rhymes_scheme = options[:rhymes_scheme] || :enclosed
    @verses = build_verses
  end

  def rhymes_pattern
    case @rhymes_scheme
    when :enclosed then "ABBA"
    when :alternate then "ABAB"
    when :monorhyme then "AAAA"
    when :prose then "ABCD"
    when :sonnet then "ABABCDCDEFEFGG"
    else "AABB"
    end.split('')
  end

  def build_verses
    rhymes_pattern.map do |rhyme|
      rhyming_word =
        verses_cache_for(rhyme).last.try(:rhyming_word).try(:rhyming_words).try(:sample)

      Verse.new(rhyming_word: rhyming_word, feet_count: @feet_count).tap do |verse|
        verses_cache_for(rhyme) << verse
      end
    end

  rescue VerseError::FeetCountError
    retry
  ensure
    purge_verses_cache
  end

  def verses_cache_for(rhyme)
    ((@verses_cache ||= {})[rhyme] ||= [])
  end

  def purge_verses_cache
    @verses_cache = nil
  end

  def to_s
    @verses.map(&:to_s).join(",\n")
  end

end
