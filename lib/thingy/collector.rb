require "thingy/collector/version"

module Thingy
  module Collector

    def self.included(base)
      base.class_eval do
        extend ClassMethods
      end
    end

    module ClassMethods
      def attributes(*attrs)
        if attrs.any?
          self.attributes.merge(attrs)
          attrs.each do |attr|
            define_attr_accessor(attr) unless attribute_defined?(attr)
          end
        else
          @attributes ||= Set.new
        end
      end

      def define_attr_accessor(attr)
        attr_accessor(attr)
      end

      def attribute_defined?(name)
        instance_methods.include?(name)
      end
    end
  end
end
