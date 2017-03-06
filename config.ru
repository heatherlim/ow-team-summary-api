require 'rubygems'
require 'bundler'
require 'open-uri'
Bundler.require

require './server'
require './scraper'

run Sinatra::Application