class BuildContentJob < ActiveJob::Base

  queue_as :default

  def perform
    Content.create(
      title: content_title,
      body: content_body
    )
  end

  def content_body
    @poem ||= Poem.new(format: :long).to_s
  end

  def content_title
    return @title if defined?(@title)

    word = Word.order("RANDOM()").limit(1).first

    @title = word.value
  end

end
