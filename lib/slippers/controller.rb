# frozen_string_literal: true

module Slippers
  # Base controller
  class Controller
    extend Forwardable
    include ViewRendering

    delegate %i[request response routes logger] => :@context
    delegate %i[helpers] => :routes
    delegate %i[params] => :request

    attr_reader :context, :request

    def initialize(context, request)
      @context = context
      @request = request
      extend(helpers)
    end

    def send_action(action)
      public_send(action)
    end
  end
end
