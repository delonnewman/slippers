# frozen_string_literal: true

module Slippers
  class DesktopController < Controller
    def index
      render Page, BrowserView.new(ClassListView.new(class_list: ClassList.new), MethodListView.new(method_list: MethodList.new(class_object: nil)))
    end
  end
end
