# frozen_string_literal: true

module Slippers
  class Application < ApplicationBase
    get '/', DesktopController, :index
    get '/browser', BrowserController, :index
    get '/browser/:class_id', BrowserController, :methods
    get '/browser/:class_id/:method_name', BrowserController, :source
  end
end
