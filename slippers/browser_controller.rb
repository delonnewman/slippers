# frozen_string_literal: true

module Slippers
  class BrowserController < Controller
    def index
      render BrowserView, ClassListView.new(class_list: ClassList.new), MethodListView.new(method_list: MethodList.new(class_object: nil))
    end

    def class_methods
      render MethodListView, method_list: ClassList.new.method_list(params[:class_name])
    end

    def method_source
    end
  end
end
