# coding: utf-8

require 'spec_helper'

describe GrowthPush::Request do
  context "vebs is :get" do
    subject { GrowthPush::Request.new(:get, 'notifications', {}, {}).create }
    it ("should return instance of Net::HTTP:Get") { should be_an_instance_of(Net::HTTP::Get) }
  end

  context "vebs is :post" do
    subject { GrowthPush::Request.new(:post, 'clients', {}, {}).create }
    it ("should return instance of Net::HTTP:Post") { should be_an_instance_of(Net::HTTP::Post) }
  end

  context "vebs is :put" do
    subject { GrowthPush::Request.new(:put, 'clients/test', {}, {}).create }
    it ("should return instance of Net::HTTP:Delete") { should be_an_instance_of(Net::HTTP::Put) }
  end
end
