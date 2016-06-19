module PoemError

  class NoRhymesError < StandardError

    def initialize(message = "No rhymes were found !")
      super(message)
    end

  end

end