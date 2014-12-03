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

        server.mount_proc('/say') do |request|
          @robot.say(message_attributes(request))
        end

        server.mount_proc('/message') do |request|
          @robot.receive(request.query.symbolize_keys)
        end

        Thread.new do
          server.start
        end
      end

      def port
        ENV['LISTEN_PORT'] || '8877'
      end

      def message_attributes(request)
        attributes = request.query.symbolize_keys

        from = attributes[:from]
        to   = attributes[:to]

        attributes[:from] = to
        attributes[:to] = from

        attributes
      end
    end
  end
end
