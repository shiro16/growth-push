require 'cgi'

module GrowthPush
  class Request
    attr_reader :method, :endpoint, :headers, :params

    def initialize(method, endpoint, headers, params)
      @method   = method
      @endpoint = endpoint
      @headers  = headers
      @params   = params
    end

    def create
      send(method)
    end

    private
    def get
      uri = generate_uri_from_params(endpoint, params)
      request = Net::HTTP::Get.new(uri)
      headers.each { |k, v| request[k.to_s] = v.to_s}
      request
    end

    def post
      request = Net::HTTP::Post.new("/#{endpoint}")
      request.set_form_data(params)
      headers.each { |k, v| request[k.to_s] = v.to_s}
      request
    end

    def put
      request = Net::HTTP::Put.new("/#{endpoint}")
      request.set_form_data(params)
      headers.each { |k, v| request[k.to_s] = v.to_s}
      request
    end

    def generate_uri_from_params(endpoint, params)
      if params.empty?
        "/#{endpoint}"
      else
        query_string = params.collect {|k, v| "#{CGI.escape(k.to_s)}=#{CGI.escape(v.to_s)}" }.join("&")
        "/#{endpoint}?#{query_string}"
      end
    end
  end
end

