module VerseError

  class NoRhymesError < StandardError

    def initialize(message = "No more rhymes are available !")
      super(message)
    end

  end

end