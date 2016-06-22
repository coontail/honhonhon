class WordsCleanJob < ActiveJob::Base

  def perform
    Word.inpronounceable.destroy_all
    Word.containing_numbers.destroy_all
  end

end