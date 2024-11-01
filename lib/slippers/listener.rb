# frozen_string_literal: true

require 'drb/drb'

require_relative 'registry'

module Slippers
  class Listener
    include DRb::DRbUndumped

    def self.start(name:)
      Thread.new { new(name:).start }
    end

    def initialize(name:)
      @name = name
      @port = 4.times.map { rand(9) + 1 }.join
      @uri = "druby://localhost:#@port"
      @registry = Registry.new
    end

    def start
      @registry.add(uri: @uri, name: @name)
      $stderr.puts("Starting listener for #@name at #@uri")
      DRb.start_service(@uri, self)
      DRb.thread.join
    end

    def class_index
      Slippers::ClassList::Index.new
    end
  end
end
