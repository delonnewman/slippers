# frozen_string_literal: true

module Slippers
  class MethodSourceView < View
    template <<~ERB
      <div id="slippers-browser-method-source" class="overflow-scroll" style="height:100vh">
        <% if method_source.available? %>
           <pre><%=h method_source.code %></pre>
        <% else %>
           <p>Source is not available</p>
        <% end %>
      </div>
    ERB
  end
end
