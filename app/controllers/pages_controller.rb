class PagesController < ApplicationController
  include PagesHelper

  before_filter :build_poem
  before_filter :build_title

  def home;end

  private

  def build_poem
    @poem = Poem.new(format: :long).to_s
  end

  def build_title
    @title = Word.limit(1000).sample.try(:value).capitalize
  end

end
