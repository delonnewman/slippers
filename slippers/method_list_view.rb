# frozen_string_literal: true

module Slippers
  class MethodListView < View
    template <<~ERB
      <div id="slippers-browser-method-list" class="overflow-scroll" style="height:100vh">
        <div id="slippers-class-methods">
          <h4>Class Methods</h4>
          <% method_list.ruby_class_methods.each do |method| %>
            <div class="slippers-list-item">
              <%=h method.to_s %>
            </div>
          <% end %>
        </div>
        <div id="slippers-class-methods">
          <h4>Instance Methods</h4>
          <% method_list.ruby_instance_methods.each do |method| %>
            <div class="slippers-list-item">
              <%=h method.to_s %>
            </div>
          <% end %>
        </div>
      </div>
    ERB
  end
end
