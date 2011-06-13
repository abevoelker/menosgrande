class PagesController < ApplicationController
  def home
  end

  def faq
    @title = "FAQ"
  end

  def api
    @title = "API"
  end

end
