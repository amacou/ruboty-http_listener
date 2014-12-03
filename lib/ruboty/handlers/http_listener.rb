module Ruboty
  module Handlers
    class HttpListener < Base
      env :LISTEN_PORT, 'Listening port(default is 8877)', optional: true

      def initialize(robot)
        super
        start
      end

      def start
        server = WEBrick::HTTPServer.new({ Port: port, Logger: Ruboty.logger })

        server.mount_proc('/say') do |req|
          @robot.say(req.query.symbolize_keys)
        end

        server.mount_proc('/message') do |req|
          @robot.receive(req.query.symbolize_keys)
        end

        Thread.new do
          server.start
        end
      end

      def port
        ENV['LISTEN_PORT'] || '8877'
      end
    end
  end
end
