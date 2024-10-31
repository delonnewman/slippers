# frozen_string_literal: true

module Slippers
  class ErrorView < View
    template <<~ERB
      <h1><%=h error.class %></h1>
      <p><%=h error.message %></p>
    ERB
  end
end
