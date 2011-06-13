# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

require 'json'
require 'active_support/all'

VALID_CODE_POINTS_FILE = 'db/valid_code_points.json'
URI_RESERVED  = ":/?#[]@!$&'()*+,;="
PARANOID_RESERVED = "\\%."

REDIS.flushdb # Blow it all away

# Set the domains and their counters
domains = ['127.0.0.1', '0.0.0.0']
domains.each do |domain|
  REDIS.sadd('domains', domain)
  REDIS.set(domain, 0)
end

# Set the allowed Unicode code points
code_points = []
code_points = JSON.parse(File.open(VALID_CODE_POINTS_FILE, &:readline).chomp)
code_points.each do |cp|
  char = [cp].pack("U*").mb_chars
  !URI_RESERVED.include?(char) && !PARANOID_RESERVED.include?(char) && 
    REDIS.rpush('code_points', char)
end
