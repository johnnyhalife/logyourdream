# enabling the load of files from root (on Rspec)
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../')

require 'rubygems'
require 'spec'
require 'mocha'
require 'dm-core'
require "lib/models"

describe "Dream model behavior" do
  
  before do
    DataMapper.setup(:default, 'sqlite3::memory:')    
    DataMapper.auto_migrate!
  end
  
  it "should create a new dream associated with a user" do
    User.new( :alias => "user", :dream => { :title => "a dream", :body => "<p>body</p>" } ).save

    dream = User.all(:alias => "user")[0].dream
    
    dream.title.should == "a dream"        
    dream.body.should == "<p>body</p>"
  end
  
  it "should retrieve latest dreams ordered by created_on desc and return given number of records" do
    DateTime.stubs(:now).returns(DateTime.parse("2008-08-08"))
    Dream.new({ :title => "first" }).save
    DateTime.stubs(:now).returns(DateTime.parse("2008-08-09"))
    Dream.new({ :title => "second" }).save
    DateTime.stubs(:now).returns(DateTime.parse("2008-08-10"))
    Dream.new({ :title => "third" }).save
    
    dream = Dream.new()
    dreams = dream.latest(2);
    dreams.count.should == 2;
    dreams[0].title.should == "third"
    dreams[1].title.should == "second"
  end  
end