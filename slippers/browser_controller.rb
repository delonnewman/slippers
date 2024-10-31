# frozen_string_literal: true

module Slippers
  # Intermediate interactions for browser views
  class BrowserController < Controller
    def index
      render BrowserView.initial(class_list:)
    end

    def methods
      render MethodListView.new(method_list:)
    end

    def source
      render MethodSourceView.new(method_source:)
    end

    private

    def method_source
      method_list.source(
        of_method: params[:method_name],
        is_class_method: params[:class_method] == 'true'
      )
    end

    def method_list
      class_list.method_list(params[:class_id])
    end

    def class_list
      ClassList.toplevel
    end
  end
end
