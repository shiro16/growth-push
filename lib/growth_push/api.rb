require 'growth_push/api/clients'
require 'growth_push/api/events'
require 'growth_push/api/tags'
require 'growth_push/api/notifications'

module GrowthPush
  module API
    def request(verb, params={}, endpoint=nil)
      return nil if params.delete(:dummy_access) == true
      endpoint = endpoint_for_class_name if endpoint.nil?
      Client.send(verb, endpoint, params)
    end

    def endpoint_for_class_name
      self.name.match(/::([a-zA-Z]+)$/)[1].downcase
    end
  end
end
