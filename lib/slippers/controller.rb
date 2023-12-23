# frozen_string_literal: true

module Slippers
  class Controller
    extend Forwardable

    def_delegators :@context, :request, :response, :routes
    def_delegators :routes, :helpers
    def_delegators :request, :params

    attr_reader :context, :request

    def self.call(...)
      new(...)
    end

    def initialize(context, request)
      @context = context
      @request = request
      extend(helpers)
    end

    def render(view_class, ...)
      view = view_class.new(...)
      view.extend(helpers)
      view.render
    end

    def call(action)
      public_send(action)
    end
  end
end
