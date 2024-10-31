# frozen_string_literal: true

module Slippers
  class DesktopController < Controller
    def index
      render Page.new(BrowserView.initial)
    end
  end
end
