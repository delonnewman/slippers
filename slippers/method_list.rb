# frozen_string_literal: true

module Slippers
  class MethodList < Model
    def ruby_instance_methods
      return [] unless class_object

      class_object.instance_methods(false)
    end

    def ruby_class_methods
      return [] unless class_object

      class_object.methods(false)
    end
  end
end
