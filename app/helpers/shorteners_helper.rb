module ShortenersHelper

  def trimURL(urltext)
    if urltext.length > 55 then
      urltext[0..55] + "..."
    else
      urltext
    end
  end
end
