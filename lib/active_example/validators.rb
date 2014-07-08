module ActiveExample
  module Validators
    class AwesomeValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        if value.present? && !(value =~ /(awesome|dude|broham)/i)
          record.errors.add(attribute, "This isn't awesome enough!!", options)
        end
      end
    end

    # pulled from the presence validator
    module HelperMethods
      def validates_awesomeness_of(*attr_names)
        # this is basically:
        # validate AwesomeValidator.new(attributes: [:whatever])
        validates_with AwesomeValidator, _merge_attributes(attr_names)
      end
    end
  end
end
