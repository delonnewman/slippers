# frozen_string_literal: true

module Slippers
  class BrowserView < View
    template <<~ERB
      <div id="slippers-browser" class="d-flex">
        <%= yield %>
      </div>
    ERB
  end
end
