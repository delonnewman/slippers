# frozen_string_literal: true

module Slippers
  class BrowserView < View
    template <<~ERB
      <div id="slippers-browser" class="d-flex">
        <%= yield %>
      </div>
    ERB

    def self.initial(class_list: ClassList.toplevel)
      new(
        ClassListView.new(class_list:),
        MethodListView.new(method_list: MethodList.null),
        MethodSourceView.new(method_source: MethodSource.null)
      )
    end

    def render
      # binding.pry
      super
    end
  end
end
