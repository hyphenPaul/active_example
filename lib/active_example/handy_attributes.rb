module ActiveExample
  module HandyAttributes
    extend ActiveSupport::Concern

    included do
      include ActiveModel::AttributeMethods

      attribute_method_prefix 'clear_'
      attribute_method_suffix '?'
      attribute_method_affix prefix: 'turn_', suffix: '_to_ding_dong'
    end

    module ClassMethods
      def attributes(*names)
        attr_accessor(*names) # creates an instance method for each value
        define_attribute_methods(names) # adds names to the pull of method helpers
      end
    end

    def clear_attribute(attribute)
      send("#{attribute}=", nil)
    end

    def attribute?(attribute)
      send(attribute).present?
    end

    def turn_attribute_to_ding_dong(attribute)
      send("#{attribute}=", 'DING DONG')
    end
  end
end
