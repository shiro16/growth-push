# coding: utf-8

require 'spec_helper'

describe GrowthPush::Exception do
  it 'should properly set its message for inspect' do
    err = GrowthPush::Exception.new(400, "400", 'error message')
    err.inspect.should == '#<GrowthPush::Exception: error message>'
  end
end
