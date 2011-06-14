# encoding: utf-8

require 'json'
require 'active_support/all'

VALID_CODE_POINTS_FILE = 'db/valid_code_points.json'
URI_RESERVED  = ":/?#[]@!$&'()*+,;="
PARANOID_RESERVED = "\\%."

REDIS.flushdb # Blow it all away

# Set the domains and their counters
if Rails.env == 'production' then
  domains = ['æ.is']
else
  domains = ['127.0.0.1', '0.0.0.0']
end
domains.each do |domain|
  REDIS.sadd('domains', domain)
  REDIS.set(domain, 0)
end

# Set the allowed Unicode code points
code_points = []
code_points = JSON.parse(File.open(VALID_CODE_POINTS_FILE, &:readline).chomp)
# Seed the PRNG so that array is shuffled into same order each time this runs
Kernel.srand(0xABE)
code_points.shuffle!
Kernel.srand # Reseed PRNG so that it is no longer predictable
code_points.each do |cp|
  char = [cp].pack("U*").mb_chars
  !URI_RESERVED.include?(char) && !PARANOID_RESERVED.include?(char) && 
    REDIS.rpush('code_points', char)
end

