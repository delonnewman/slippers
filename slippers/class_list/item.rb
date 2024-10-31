module Slippers
  class ClassList::Item
    extend Forwardable

    def_delegators :@klass, :instance_methods, :name

    def initialize(klass)
      @klass = klass
    end

    def class_object
      @klass
    end

    def singleton_methods
      @klass.methods(false)
    end

    def label
      @klass.name || @klass.inspect
    end
    alias to_s label

    def id
      @klass.object_id
    end
  end
end
