module Middleman
  module RemoveIndention
    class Extension < ::Middleman::Extension
      def initialize(app, options = {}, &block)
        super

        app.after_build do |builder|
          puts "Called After build"
        end
      end
    end
  end
end
