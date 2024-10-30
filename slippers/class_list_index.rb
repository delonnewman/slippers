# frozen_string_literal: true

module Slippers
  class ClassListIndex
    extend Forwardable

    def_delegators :data, :values, :fetch

    def initialize(superclass: BasicObject)
      @superclass = superclass
      @data = nil
    end

    def data
      @data ||= generate
    end
    alias to_h data

    private

    def generate
      collect_classes(@superclass)
        .sort_by(&:label)
        .group_by(&:label)
        .transform_values(&:first)
        .freeze
    end

    def collect_classes(klass)
      subclasses = klass.subclasses
      list = [ClassListItem.new(klass)]
      return list if subclasses.empty?

      list + subclasses.flat_map { |klass| collect_classes(klass) }
    end
  end
end
