class PagesController < ApplicationController
  include PagesHelper

  expose(:content) { Content.random }

  def home;end

end
