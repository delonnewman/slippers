# frozen_string_literal: true

require 'logger'

module Slippers
  class ApplicationBase
    include El::Routable

    attr_reader :logger

    def initialize
      @logger = Logger.new($stderr, progname: 'Slippers', level: log_level)
    end

    def call(env)
      Slippers.reload!
      super(env)
    rescue StandardError => e
      logger.error { "#{e.message}:\n#{e.backtrace.map { "  #{_1}\n" }.join}" }
    end

    def log_level
      case rack_env
      when :development
        Logger::DEBUG
      else
        Logger::ERROR
      end
    end
  end
end
