class PagesController < ApplicationController
  def home
  end

  def faq
    @title = "FAQ"
  end

  def api
    @title = "API"
  end

  def privacy
    @title = "Privacy Policy"
  end

  def tos
    @title = "Terms of Service"
  end

end
