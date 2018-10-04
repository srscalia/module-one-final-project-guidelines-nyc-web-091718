require 'bundler'
Bundler.require

Dotenv.load # hides our API key

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger = nil # turns off our mr SQL logger

require_all 'lib'
