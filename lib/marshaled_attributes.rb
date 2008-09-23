module SimplesIdeias
  module Marshaling
    def self.included(base)
      base.extend ClassMethods
      
      class << base
        attr_accessor :marshaled_attributes_options
      end
    end
      
    module ClassMethods
      # marshaled_attributes :title, :settings
      def marshaled_attributes(*attrs)
        self.marshaled_attributes_options = {
          :attributes => attrs
        }
        
        include SimplesIdeias::Marshaling::InstanceMethods

        after_initialize :add_marshaled_attributes!
      end
    end
    
    module InstanceMethods
      private
        def add_marshaled_attributes!
          evaluate = self.class.marshaled_attributes_options[:attributes].inject("") do |memo, name|
            memo + %(
              def #{name}
                Marshal.load read_attribute(:#{name}) unless read_attribute(:#{name}).blank?
              end
              
              def #{name}=(value)
                write_attribute(:#{name}, Marshal.dump(value))
              end
            )
          end

          self.class.class_eval(evaluate)
        end
    end
  end
end