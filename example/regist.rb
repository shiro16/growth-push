lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'growth_push'

GrowthPush.configure do |config|
  config.application_id = 'your application id'
  config.client_secret  = 'your client secret'
  config.api_host       = 'api.growthpush.com'
  config.api_version    = 1
  config.environment    = 'development'
  config.use_ssl        = true
  # config.debug        = true
  # config.options      = {}
end

params = {
  token: "",
  os: "ios",
  environment: GrowthPush.configuration.environment
}
GrowthPush::API::Clients.request(:post, params)
GrowthPush::Client.post('clients', params)
