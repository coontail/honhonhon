class Verse 

  attr_reader :base_word
  attr_reader :words

  def initialize(options = {})
    @feet_count = options[:feet_count] || 12
    @base_word = options[:base_word] || Word.get_random_rhyming_word
    @words = [@base_word]
    @counter = @feet_count - @base_word.syllables_count

    build
  end

  def build
    until @counter == 0 do
      word = last_word.preceding_words.where("syllables_count <= ?", @counter).sample
      
      raise VerseError::NoRhymesError unless word.present?

      @words << word
      @counter -= last_word.syllables_count
    end

    @words.reverse!
  end

  def last_word
    @words.last
  end

  def to_s
    @words.flatten.map(&:value).join(" ").capitalize
  end
  
end