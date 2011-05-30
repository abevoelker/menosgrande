class Shortener < ActiveRecord::Base
  validates :url, :presence => true, :uniqueness => true, :http_uri_format => true
  validates :key, :presence => true

end
