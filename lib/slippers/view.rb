# frozen_string_literal: true

module Slippers
  class View
    include ViewHelper

    def self.render(...)
      new(...).render
    end

    def self.template(string = nil)
      return @template if defined?(@template)

      @template = string
    end

    attr_accessor :parent
    attr_reader :data, :children

    def initialize(*children, **data)
      @children = children.each do |child|
        child.parent = self
      end
      @data = data
      data.each do |key, value|
        value.add_observer(self) if value.is_a?(Model)
      end
    end

    def update(key, model)
      data[key] = model
    end

    def parent?
      !!@parent
    end

    def render
      render_template do
        buffer = +''
        children.each do |child|
          buffer << child.render
        end
        buffer.freeze
      end
    end

    def render_template
      template = self.class.template
      return unless template

      eval(Erubi::Engine.new(template).src)
    end

    private

    def respond_to_missing?(method, include_all)
      data.key?(method) || (parent? && parent.respond_to?(method, include_all)) || super
    end

    def method_missing(method, *args, **kwargs, &block)
      if data.key?(method)
        data[method]
      elsif parent? && parent.respond_to?(method)
        parent.public_send(method)
      else
        super
      end
    end
  end
end
