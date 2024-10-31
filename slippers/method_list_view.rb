# frozen_string_literal: true

module Slippers
  class MethodListView < View
    template <<~ERB
      <div id="slippers-browser-method-list" class="overflow-scroll" style="height:100vh">
        <h1><%=h method_list.class_name %></h1>
        <div id="slippers-class-methods">
          <h4>Class Methods</h4>
          <% method_list.ruby_class_methods.each do |method| %>
            <div class="slippers-list-item">
              <a href="#"
                 hx-get="/browser/<%=u method_list.class_name %>/<%=u method.name %>/?class_method=true"
                 hx-target="#slippers-browser-method-source"
                 hx-swap="outerHTML"
              >
                 <%=h method.name %>
              </a>
            </div>
          <% end %>
        </div>
        <div id="slippers-class-methods">
          <h4>Instance Methods</h4>
          <% method_list.ruby_instance_methods.each do |method| %>
            <div class="slippers-list-item">
              <a href="#"
                 hx-get="/browser/<%=u method_list.class_name %>/<%=u method.name %>"
                 hx-target="#slippers-browser-method-source"
                 hx-swap="outerHTML"
              >
                 <%=h method.name %>
              </a>
            </div>
          <% end %>
        </div>
      </div>
    ERB
  end
end
