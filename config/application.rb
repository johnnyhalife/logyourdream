require 'dm-core'
require 'dm-constraints'

configure do
  # Datamapper configuration
  DataMapper.setup(:default, ENV['DATABASE_URL'] || 'sqlite3:///../logyourdream.db')
  DataMapper.auto_migrate!
end