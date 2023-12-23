# frozen_string_literal: true

module Slippers
  class ApplicationBase
    include El::Routable

    def call(env)
      Slippers.reload!
      super(env)
    end
  end
end
