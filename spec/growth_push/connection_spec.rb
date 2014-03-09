# coding: utf-8

require 'spec_helper'

describe GrowthPush::Connection do
  before { stub_request(:get, /\w+/).to_return(:status => 200, :body => '{}') }

  context "#get" do
  end

  context "call not allow http method" do
    it "should raise an argument error" do
      expect {
        conn = GrowthPush::Connection.new({})
        conn.request(:test, 'notifications')
      }.to raise_error(ArgumentError)
    end
  end
end
