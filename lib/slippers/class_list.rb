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

    def index
      @index ||= collect_classes(superclass).sort_by(&:label).group_by(&:label).transform_values(&:first).freeze
    end
    alias to_h index

    def method_list(class_name)
      MethodList.new(class_object: index.fetch(class_name))
    end

    private

    def collect_classes(klass)
      subclasses = klass.subclasses
      list = [ClassListItem.new(klass)]
      return list if subclasses.empty?

      list + subclasses.flat_map { |klass| collect_classes(klass) }
    end
  end
end
