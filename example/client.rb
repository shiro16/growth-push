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

response = GrowthPush::Client.get('notifications', params)
