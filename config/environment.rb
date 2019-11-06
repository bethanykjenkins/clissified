#loads gems from gemfile so you do not have to type them all

require 'bundler/setup' #require the bundle
Bundler.require 
require 'open-uri' #store the HTML content in a string variable (an example of doing this is provided later)

#module needed for scraping

Clissified::CLI.new.call 
