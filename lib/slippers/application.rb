# frozen_string_literal: true

module Slippers
  # Application delegate
  class Application
    extend Forwardable
    include ViewRendering

    def self.handler
      app = new
      lambda do |env|
        El::RackCall.new(env, routes, context: app).evaluate
      end
    end

    def self.env
      Application::Environment.default
    end

    def self.routes
      ApplicationRouter.routes
    end

    delegate %i[routes] => 'self.class'
    delegate %i[helpers] => :routes

    def initialize
      @env = self.class.env
      @logger = Logger.new($stderr, progname: 'Slippers', level: env.development? ? Logger::DEBUG : Logger::ERROR)
      logger.info { "Initialzing Slippers in #{env} environment" }
    end

    def not_found
      logger.info { 'Not found' }

      render Page, NotFoundView.new
    end

    def error(error)
      logger.error { "#{error.message}:\n#{error.backtrace.map { "  #{_1}" }.join("\n")}" }

      render Page, ErrorView.new(error:)
    end

    def receive(request)
      (controller, action) = request.route.action
      logger.info { "Rendering #{action_reference(action, controller)} from #{request.request_method} #{request.original_path}" }

      Slippers.reload! if env.development?
      controller.new(self, request).send_action(action)
    end

    private

    attr_reader :logger, :env

    def action_reference(action, controller)
      controller = controller.name.split('::').last.sub('Controller', '').downcase

      "#{controller}##{action}"
    end
  end
end
