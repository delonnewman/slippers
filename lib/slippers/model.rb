# frozen_string_literal: true

require 'observer'

module Slippers
  class Model
    include Observable

    def initialize(**data)
      @data = data
    end

    def update_views(key, data)
      notify_observers(key, data)
      self.data = data
      self
    end

    def data=(data)
      changed
      @data = data
    end

    private

    attr_reader :data

    def respond_to_missing?(method, include_all)
      @data.key?(method) || super
    end

    def method_missing(method, ...)
      return super unless @data.key?(method)

      @data[method]
    end
  end
end
