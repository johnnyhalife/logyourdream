require 'dm-core'

configure do
  # Datamapper configuration
  DataMapper.setup(:default, 'sqlite3:///../logyourdream.db')
  DataMapper.auto_migrate!
end