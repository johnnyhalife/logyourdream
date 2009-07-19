require 'dm-core'
require 'do_postgres'
require 'dm-constraints'

configure do
  # Datamapper configuration
  DataMapper.setup(:default, ENV['DATABASE_URL'] || 'sqlite3:///../logyourdream.db')
  DataMapper.auto_migrate!
end