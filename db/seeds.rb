# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# Set the domains and their counters
domains = ['127.0.0.1', '0.0.0.0']
REDIS.del('domains') #Silly way to empty a set
domains.each do |domain|
  REDIS.sadd('domains', domain)
  REDIS.set(domain, 500)
end

