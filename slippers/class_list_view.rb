# frozen_string_literal: true

module Slippers
  class ClassListView < View
    template <<~ERB
      <div id="slippers-browser-class-list" class="overflow-scroll" style="height:100vh">
        <% class_list.each do |item| %>
          <div class="slippers-list-item">
            <a href="#" hx-get="/browser/<%=u item.label %>" hx-target="#slippers-browser-method-list" hx-swap="outerHTML"><%=h item.label %></a>
          </div>
        <% end %>
      </div>
    ERB
  end
end
