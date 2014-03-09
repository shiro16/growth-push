module GrowthPush
  class Configuration
    attr_accessor :application_id, :secret, :api_host, :api_version, :use_ssl, :environment, :debug, :options

    def initialize
      @application_id = nil
      @secret         = nil
      @api_host       = nil
      @api_version    = nil
      @use_ssl        = true
      @environment    = nil
      @debug          = true
      @options        = {}
    end
  end
end
