class Shortener < ActiveRecord::Base
  validates :url, :presence => true
  validates :key, :presence => true
end
