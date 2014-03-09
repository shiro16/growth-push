module GrowthPush
  module Client
    class << self
      def get(endpoint, params={})
        connection = Connection.new(params)
        connection.get(endpoint)
      end

      def post(endpoint, params={})
        connection = Connection.new(params)
        connection.post(endpoint)
      end

      def put(endpoint, params={})
        connection = Connection.new(params)
        connection.put(endpoint)
      end
    end
  end
end
