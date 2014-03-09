require 'open-uri'
require 'net/http'
require 'net/https'

module GrowthPush
  module_function
  def configure(&block)
    clear_configuration unless @_configuration
    yield(configuration)
  end

  def configuration
    @_configuration ||= Configuration.new
  end

  def clear_configuration
    @_configuration = Configuration.new
  end
end

require "growth_push/version"
require "growth_push/api"
require "growth_push/client"
require "growth_push/configuration"
require "growth_push/connection"
require "growth_push/request"
require "growth_push/response"
require "growth_push/exception"
