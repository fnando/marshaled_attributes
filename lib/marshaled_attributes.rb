require "active_record"
require "marshaled_attributes/active_record"
require "marshaled_attributes/version"

ActiveRecord::Base.send(:include, MarshaledAttributes::ActiveRecord)
