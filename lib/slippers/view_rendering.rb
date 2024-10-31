module Slippers
  module ViewRendering
    def render(view, ...)
      if view.is_a?(Class)
        view.include(helpers)
        view = view.new(...)
      else
        view.extend(helpers)
      end
      view.render
    end
  end
end
