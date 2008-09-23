require "marshaled_attributes"

# ActiveRecord only calls after_initialize callbacks only if is
# explicitly defined in a class.
class ActiveRecord::Base # :nodoc:
  def after_initialize; end
end

ActiveRecord::Base.send(:include, SimplesIdeias::Marshaling)