module ShortenersHelper
  def shortlink_for(shortener)
    "http://#{shortener.domain}/#{shortener.key}"
  end
end
