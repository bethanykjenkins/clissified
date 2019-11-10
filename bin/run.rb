#!/usr/bin/env ruby
#where code is run

#requires code from environment file
require "bundler/setup"
require "clissified"

Clissified::CLI.new.call 
