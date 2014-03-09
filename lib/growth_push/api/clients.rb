# coding: utf-8

module GrowthPush
  module API
    class Clients
      extend API

      class << self
        def update(params={})
          endpoint = "clients/#{params[:client_id]}"
          request(:put, params, endpoint)
        end
      end
    end
  end
end
