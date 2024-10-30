# frozen_string_literal: true

module Slippers
  class ClassList < Model
    extend Forwardable
    include Enumerable

    def_delegators :to_a, :each

    def initialize(superclass: BasicObject)
      super
    end

    def to_a
      index.values
    end

    def method_list(class_name)
      MethodList.new(class_object: index.fetch(class_name))
    end

    def index
      @index ||= ClassListIndex.new(superclass)
    end
  end
end
