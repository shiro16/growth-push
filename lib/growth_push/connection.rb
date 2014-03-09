require 'set'

module GrowthPush
  class Connection
    # A Set of allowed HTTP verbs.
    METHODS = Set.new [:get, :post, :put]

    attr_reader :headers, :params, :is_auth

    def initialize(params={})
      user_agent = params.delete(:user_agent)
      @headers = setup_headers(user_agent)
      @headers["User-Agent"] ||= "GrowthPush Ruby Library v#{VERSION}"
      @params = setup_params(params)
    end

    def get(endpoint)
      request(:get, endpoint)
    end

    def post(endpoint)
      request(:post, endpoint)
    end

    def put(endpoint)
      request(:put, endpoint)
    end

    def request(method, endpoint)
      raise ArgumentError, "unknown HTTP method: #{method}" unless METHODS.include?(method)

      request = Request.new(method, "#{GrowthPush.configuration.api_version}/#{endpoint}", headers, params)

      response = http.start do |http|
        http.request request.create
      end

      Response.handle(response)
    end

    private
    def http
      use_ssl = ssl?
      http = Net::HTTP.new(
        GrowthPush.configuration.api_host,
        use_ssl ? 443 : 80
      )
      http.use_ssl = use_ssl
      http
    end

    def setup_headers(user_agent=nil, headers={})
      headers["User-Agent"] = user_agent if user_agent
      headers
    end

    def setup_params(params)
      params[:applicationId] = GrowthPush.configuration.application_id
      params[:secret]        = GrowthPush.configuration.secret
      params[:environment]   = GrowthPush.configuration.environment
      params
    end

    def ssl?
      GrowthPush.configuration.use_ssl == true
    end
  end
end
