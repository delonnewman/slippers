# frozen_string_literal: true

require 'bundler/setup'
Bundler.require

$LOAD_PATH << 'vendor/ruby/el-toolkit/el-core/lib' << 'vendor/ruby/el-toolkit/el-routing/lib'
require 'el/constants'
require 'el/routable'

module Slippers
  def self.load
    @loader ||= Zeitwerk::Loader.new
    yield @loader
  end

  def self.reload!
    @loader.reload
  end
end

Slippers.load do |loader|
  loader.push_dir('.')
  loader.push_dir('lib')
  loader.ignore('boot.rb')
  loader.ignore('config.ru')
  loader.enable_reloading
  loader.setup

  Listen.to('.') do |_modified, _added, _removed|
    loader.reload
  end
end

module Slippers
  def self.app
    @app ||= Application.new
  end
end
