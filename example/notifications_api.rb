lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'growth_push'

GrowthPush.configure do |config|
  config.application_id = 'your application id'
  config.client_secret  = 'your client secret'
  config.api_host       = 'api.growthpush.com'
  config.api_version    = 1
  config.use_ssl        = true
  config.environment    = 'development'
  # config.debug        = true
  # config.options      = {}
end

params = {page: 1, limit: 50}
GrowthPush::API::Notifications.request(:get)
GrowthPush::API::Notifications.request(:get, params)
