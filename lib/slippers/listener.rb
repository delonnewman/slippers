# frozen_string_literal: true

require 'drb/drb'

module Slippers
  class Listener
    include DRb::DRbUndumped

    def self.start(name:)
      new(name:).start
    end

    def initialize(name:)
      @name = name
      @port = format('%04d', rand(9999))
      @uri = "druby://localhost:#@port"
      @registry = Registry.new
    end

    def start
      @registry.add(uri: @uri, name: @name)
      DRb.start_service(@uri, self)
      DRb.thread.join
    end

    def class_index
      ClassList::Index.new
    end
  end
end
