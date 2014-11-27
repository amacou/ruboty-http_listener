module Ruboty
  module Handlers
    class HttpListener < Base
      env :LISTEN_PORT, 'Listening port(default is 8877)', optional: true

      def initialize(robot)
        super
        start
      end

      def start
        server = TCPServer.open(port)
        Thread.new do
          while true
            Thread.start(server.accept) do |socket|
              request = Ruboty::HttpListener::Request.new socket.gets

              if request && request.body
                message.reply(request.body, request.option)
              end

              socket.write response
              socket.close
            end
          end
        end
      end

      def default_message
        { from: '', to: '', robot: @robot }
      end

      def port
        ENV['LISTEN_PORT'] || '8877'
      end

      def message
        Message.new(default_message)
      end

      def response
        <<-EOF.strip_heredoc.strip
          HTTP/1.1 200 OK
          Content-Type: text/plain; charset=UTF-8
          Server: #{ @robot.name }
          Connection: close
        EOF
      end
    end
  end
end
