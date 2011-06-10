# == Schema Information
# Schema version: 20110601022425
#
# Table name: shorteners
#
#  id         :integer         not null, primary key
#  url        :string(255)
#  key        :string(255)
#  created_at :datetime
#  updated_at :datetime
#  domain     :string(255)
#

require 'redis'
require 'addressable/uri'

class Shortener < ActiveRecord::Base
  attr_accessible :url

  validates :url, :presence => true, :uniqueness => true, :uri_format => true

  after_validation :normalize_url
  before_create :set_autogenerated_info
  
  def shortlink
    "http://#{domain}/#{key}"
  end

  private
    def normalize_url
      return if errors[:url].any?
      uri = Addressable::URI.heuristic_parse(url, {:scheme => "http"})
      write_attribute(:url, uri.normalize.to_s)
    end

    def set_autogenerated_info
      domain = get_random_domain
      key = get_next_key(domain)
      write_attribute(:domain, domain)
      write_attribute(:key, key)
    end

    def get_random_domain
      REDIS.SRANDMEMBER('domains')
    end

    def get_next_key(domain)
      [REDIS.incr(domain).to_i].pack("U*").mb_chars
    end
end
