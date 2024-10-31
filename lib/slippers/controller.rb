# frozen_string_literal: true

module Slippers
  class Controller
    extend Forwardable

    def_delegators :@context, :request, :response, :routes, :logger
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

    def render(view, ...)
      if view.is_a?(Class)
        view.include(helpers)
        view = view.new(...)
      else
        view.extend(helpers)
      end
      view.render
    end

    def call(action)
      logger.info { "Rendering #{action_reference(action)} from #{request.request_method} #{request.original_path}" }
      public_send(action)
    end

    private

    def action_reference(action)
      controller = self.class.name.split('::').last.sub('Controller', '').downcase

      "#{controller}##{action}"
    end
  end
end
