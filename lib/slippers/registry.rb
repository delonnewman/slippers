require 'json'

module Slippers
  class Registry
    extend Forwardable
    include Enumerable

    delegate %i[each] => :@entries
    delegate %i[delete exist?] => :@path

    FILENAME = '.slippers-registry'

    def initialize
      @path = Pathname(ENV['HOME']).join(FILENAME)
      if @path.exist?
        @entries = read
      else
        @entries = []
        @path.write('[]')
      end
    end

    def insert(entry)
      add(entry)
      write
      self
    end

    def add(entry)
      @entries << entry
      self
    end

    def write
      update!
      @path.write(@entries.to_json)
    end

    def update!
      entries = read
      return if entries == @entries

      entries.each do |entry|
        @entries << entry unless @entries.include?(entry)
      end

      self
    end

    def read
      JSON.parse(@path.read, symbolize_names: true)
    end
  end
end
