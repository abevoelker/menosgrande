require 'redis'

class Shortener < ActiveRecord::Base
  attr_accessible :url

  validates :url, :presence => true, :uniqueness => true, :http_uri_format => true

  before_save :set_key

  private
    def set_key
      write_attribute(:key, get_next_key)
    end

    def get_next_key
      [REDIS.incr('key').to_i].pack("U*").mb_chars
    end
end
