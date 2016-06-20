class WordsCleanJob < ActiveJob::Base

  def perform
    Word.inpronounceable_words.destroy_all
    Word.ugly_words.each(&:destroy)
  end

end