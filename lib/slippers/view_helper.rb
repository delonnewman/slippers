# frozen_string_literal: true

require 'erb'

module Slippers
  module ViewHelper
    def h(string)
      ERB::Escape.html_escape(string)
    end

    def u(string)
      ERB::Util.url_encode(string)
    end
  end
end
