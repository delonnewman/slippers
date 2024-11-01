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
      @registry.insert(uri: @uri, name: @name)
      $stderr.puts("Starting listener for #@name at #@uri")
      DRb.start_service(@uri, self)
      DRb.thread.join
    end

    def class_index
      collect_classes(BasicObject)
        .sort_by(&:name)
        .group_by(&:name)
        .transform_values(&:first)
        .freeze
    end

    def collect_classes(klass)
      subclasses = klass.subclasses
      list = [klass]
      return list if subclasses.empty?

      list + subclasses.flat_map { |klass| collect_classes(klass) }
    end
  end
end
