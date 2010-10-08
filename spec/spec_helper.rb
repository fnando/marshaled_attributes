require "rspec"
require "marshaled_attributes"

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

load("schema.rb")

class Beer < ActiveRecord::Base
  marshaled :meta
end
