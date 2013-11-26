# Load the rails application
require File.expand_path('../application', __FILE__)

require 'memcached/rails'



# Initialize the rails application
Blog::Application.initialize!
