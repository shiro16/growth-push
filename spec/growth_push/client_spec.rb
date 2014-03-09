# coding: utf-8

require 'spec_helper'

describe GrowthPush::Client do
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

  context "#get" do
  end

  context "#post" do
  end

  context "#put" do
  end
end
