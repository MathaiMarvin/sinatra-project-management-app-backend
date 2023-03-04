# WE will configure app to run on rackup files hence the environment variable below.
ENV["RACK_ENV"] ||="development"

# Sets up code from our gems
require "bundler/setup"

Bundler.require(:default, ENV["RACK_ENV"])

require_all "app"
