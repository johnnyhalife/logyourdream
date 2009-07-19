require 'rubygems'
require 'sinatra'
require 'config/application'
require 'dm-core'

load 'lib/models.rb'

dream_service = Dream.new()

get "/" do
  erb :coming_soon
end

get "/dreams/?" do  
  dream = Dream.new()
  @dreams = dream_service.latest(3);

  erb :dreams
end

post "/dreams" do
  User.new( :alias => params['user']['alias'], :dream => params['dream'] ).save
  @dreams = dream_service.latest(3);
  
  erb :dreams
end