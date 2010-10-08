module MarshaledAttributes
  module ActiveRecord
    def self.included(base)
      base.extend ClassMethods

      class << base
        attr_accessor :marshaled_attributes_options
      end
    end

    module ClassMethods
      # marshaled :title, :settings
      def marshaled(*attrs)
        self.marshaled_attributes_options = {
          :attributes => attrs
        }

        include InstanceMethods

        after_initialize do
          add_marshaled_attributes
        end
      end
    end

    module InstanceMethods
      private
      def add_marshaled_attributes
        self.class.class_eval do
          marshaled_attributes_options[:attributes].each do |name|
            define_method name do
              Marshal.load read_attribute(name) unless read_attribute(name).blank?
            end

            define_method "#{name}=" do |value|
              write_attribute(name, Marshal.dump(value))
            end
          end
        end
      end
    end
  end
end
