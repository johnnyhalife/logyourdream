require 'rubygems'
require 'dm-core'
require 'dm-timestamps'

class User
   include DataMapper::Resource
   
   property :id, Integer, :serial => true 
   property :alias, String

   has 1, :dream
end

class Dream
   include DataMapper::Resource
   
   property :id, Integer, :serial => true 
   property :title, String
   property :body, Text
   property :created_at, DateTime
   belongs_to :user
      
   def latest(qty)     
     dreams = Dream.all(:limit => qty, :order => [:created_at.desc])
   end
end