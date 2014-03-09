# coding: utf-8

require 'spec_helper'

describe GrowthPush do
  context 'configure set applicaton_id secret environment' do
    before do
      GrowthPush.configure do |config|
        config.application_id = 0
        config.secret         = 'test secret'
        config.environment    = 'development'
      end
    end

    it { GrowthPush.configuration.application_id.should == 0 }
    it { GrowthPush.configuration.secret.should == 'test secret' }
    it { GrowthPush.configuration.environment.should == 'development' }
  end
end
