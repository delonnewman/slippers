# frozen_string_literal: true

require 'logger'
require 'bundler/setup'
Bundler.require

$LOAD_PATH << "#{__dir__}/vendor/ruby/el-toolkit/lib"
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
  loader.push_dir(__dir__)
  loader.push_dir("#{__dir__}/lib")
  loader.ignore("#{__dir__}/boot.rb")
  loader.ignore("#{__dir__}/config.ru")
  loader.enable_reloading
  loader.setup

  Listen.to('.') do |_modified, _added, _removed|
    loader.reload
  end
end
