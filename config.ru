require 'application'
run DataMapper.auto_upgrade!
run Sinatra::Application
