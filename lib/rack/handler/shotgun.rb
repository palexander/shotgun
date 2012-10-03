###### WARNING ######
# This is not working properly.
# TODO: The rackup process will load shotgun properly via this handler, but shotgun
# won't reload/fork the app properly. More work required to use via rackup.
###### WARNING ######

require 'rack'
require 'rack/lint'
require 'rack/showexceptions'
require 'rack/handler'
require_relative '../../shotgun/runner'

module Rack
  module Handler
    class Shotgun
      def self.run(app, options={})
        ::Shotgun::Runner.start(options)
      end
    end
  end
end

Rack::Handler.register 'shotgun', 'Rack::Handler::Shotgun'