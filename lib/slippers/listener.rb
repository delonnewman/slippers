# frozen_string_literal: true

require 'drb/drb'

module Slippers
  class Listener
    def greet
      'hey'
    end
  end
end

DRb.start_service('druby://localhost:3141', Slippers::Listener.new)
DRb.thread.join
