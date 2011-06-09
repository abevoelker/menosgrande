# encoding: utf-8

module ApplicationHelper

  def title
    base_title = "menosgrande"
    if @title.nil?
      base_title
    else
      "#{@title} » #{base_title}"
    end
  end

end
