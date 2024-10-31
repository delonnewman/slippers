# frozen_string_literal: true

module Slippers
  # The source code of a method
  class MethodSource < Model
    DEFAULT_METHOD_NAME = '__id__'

    def self.null
      new(
        class_object: ClassList::DEFAULT_SUPERCLASS,
        method_name: DEFAULT_METHOD_NAME
      )
    end

    def available?
      !!location
    end

    def location
      method_object.source_location rescue binding.pry
    end

    def code
      method_object.source
    end

    def method_object
      class_object.instance_method(method_name)
    end
  end
end
