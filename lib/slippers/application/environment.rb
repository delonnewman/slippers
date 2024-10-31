# frozen_string_literal: true

module Slippers
  # An application environment descriptor
  class Application::Environment
    extend Forwardable
    delegate %i[to_sym to_s ==] => :@string

    DEFAULT = 'development'
    VARIABLE_NAME = 'SLIPPERS_ENV'

    def self.default
      new(ENV.fetch(VARIABLE_NAME, DEFAULT))
    end

    def initialize(string)
      @string = string
    end

    def development?
      @string == 'development'
    end

    def name
      @string
    end
  end
end
