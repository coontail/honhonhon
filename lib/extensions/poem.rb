class Poem

  attr_reader :stanzas

  def initialize
    @stanzas = []
  end

  def build_short_poem
    Stanza.new(feet_count: 6, rhymes_format: :embraced)
  rescue VerseError::FeetCountError
    retry
  end

  def to_s
    @stanzas.map(&:to_s).join("\n")
  end

end


