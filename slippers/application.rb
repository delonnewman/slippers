# frozen_string_literal: true

module Slippers
  class Application < ApplicationBase
    get '/', DesktopController, :index
    get '/browser', BrowserController, :index
    get '/browser/:class_name', BrowserController, :class_methods
    get '/browser/:class_name/:method_name', BrowserController, :method_source
  end
end
