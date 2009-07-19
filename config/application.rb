gem 'data_objects', '=0.9.11'
require 'data_objects'
require 'dm-core'
require 'dm-constraints'

configure do
  # Datamapper configuration
  DataMapper.setup(:default, ENV['DATABASE_URL'] || 'sqlite3:///../logyourdream.db')
  DataMapper.auto_migrate!
end