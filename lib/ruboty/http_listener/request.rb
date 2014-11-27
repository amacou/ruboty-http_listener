module Ruboty
  module HttpListener
    class Request
      include Mem

      def initialize(params)
        request = /(POST|GET) (?<path>.*) /.match(params)
        @uri = URI.parse(request[:path]) if request
      end

      def query_to_hash
        return Hash[URI.decode_www_form(@uri.query)].symbolize_keys if @uri && @uri.query
        {}
      end
      memoize :query_to_hash

      def body
        query_to_hash[:body]
      end

      def option
        query_to_hash
      end
    end
  end
end
