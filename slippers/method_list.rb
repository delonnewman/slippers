# frozen_string_literal: true

module Slippers
  # The list of methods of a class
  class MethodList < Model
    def self.null
      new(class_object: ClassList::DEFAULT_SUPERCLASS)
    end

    def ruby_instance_methods
      class_object.instance_methods(false)
    end

    def ruby_class_methods
      class_object.singleton_methods
    end

    def class_id
      class_object.object_id
    end

    def class_name
      class_object.name
    end

    def source(of_method:, is_class_method: false)
      if is_class_method
        ClassMethodSource.new(class_object:, method_name: of_method)
      else
        MethodSource.new(class_object:, method_name: of_method)
      end
    end
  end
end
