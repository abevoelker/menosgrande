# Load the rails application
require File.expand_path('../application', __FILE__)

Rails::Initializer.run do |config|
  config.middleware.use “NoWWW” if RAILS_ENV == ‘production’
end

# Initialize the rails application
UrlShorten::Application.initialize!
