class Shortener < ActiveRecord::Base
  validates :url, :presence => true, :uniqueness => true
  validates :key, :presence => true
end
