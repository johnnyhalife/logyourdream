require 'application'
DataMapper.auto_upgrade!
run Sinatra::Application
