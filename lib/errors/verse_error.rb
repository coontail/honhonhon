module VerseError

  class FeetCountError < StandardError

    def initialize(message = "Could not get the desired feet number!")
      super(message)
    end

  end

end