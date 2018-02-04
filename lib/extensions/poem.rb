class Poem

  attr_reader :stanzas

  def initialize(options = {})
    @format = options[:format] || :short
    @stanzas = [*build_stanzas]
  end

  def build_stanzas
    case @format
    when :short then build_short_poem
    when :long then build_long_poem
    when :sonnet then build_sonnet
    else []
    end
  end

  def build_short_poem
    Stanza.new(feet_count: 6, rhymes_scheme: :enclosed)
  end

  def build_long_poem
    2.times.map do
      Stanza.new(feet_count: 12, rhymes_scheme: :enclosed)
    end.flatten
  end

  def build_sonnet
    Stanza.new(feet_count: 12, rhymes_scheme: :sonnet)
  end

  def to_s
    @stanzas.map(&:to_s).join("\n\n")
  end

end


