# frozen_string_literal: true

module Slippers
  # A list of classes for the browser
  class ClassList < Model
    extend Forwardable
    include Enumerable

    def_delegators :to_a, :each

    DEFAULT_SUPERCLASS = BasicObject

    def self.toplevel
      @toplevel ||= new(superclass: DEFAULT_SUPERCLASS)
    end

    def to_a
      index.values
    end

    def method_list(class_id)
      MethodList.new(class_object: index.fetch(class_id).class_object)
    end

    def index
      @index ||= ClassList::Index.new(superclass:)
    end
  end
end
