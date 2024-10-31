module Slippers
  # The source of a class method
  class ClassMethodSource < MethodSource
    def method_object
      class_object.singleton_method(method_name)
    end
  end
end
