require 'bundler'
Bundler.require

Dotenv.load

# Seems like the appropriate place.
# Connects our models
Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

require_all 'lib'
