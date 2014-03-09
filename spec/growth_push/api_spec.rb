# coding: utf-8

require 'spec_helper'

describe GrowthPush::API::Clients do
  before do
    GrowthPush.configure do |config|
      config.application_id = 0
      config.secret         = 'test secret'
      config.api_host       = 'api.growthpush.com'
      config.api_version    = 1
      config.use_ssl        = true
      config.environment    = 'development'
    end
  end

  before { stub_request(:put, /\w+/).to_return(:status => 200, :body => '{}') }
  
  describe "#update" do
    it "" do
      GrowthPush::API::Clients.update
      a_request(:put, "https://#{GrowthPush.configuration.api_host}/#{GrowthPush.configuration.api_version}/clients/").should have_been_made.once
    end
  end
end
