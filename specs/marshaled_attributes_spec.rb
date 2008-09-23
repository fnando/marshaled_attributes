require File.dirname(__FILE__) + "/spec_helper"

# unset models used for testing purposes
Object.unset_class('Beer')

class Beer < ActiveRecord::Base
  marshaled_attributes :meta
end

describe "marshaled_attributes" do
  before(:each) do
    @beer = Beer.new(:name => 'Duffys')
    @attrs = {:taste => 'great!'}
  end
  
  it "should dump value" do
    Marshal.should_receive(:dump).with(@attrs).and_return('dumped')
    @beer.should_receive(:write_attribute).with(:meta, 'dumped')
    @beer.meta = @attrs
  end
  
  it "should load dumped value" do
    Marshal.should_receive(:load).with(@attrs).and_return('loaded')
    @beer.should_receive(:read_attribute).any_number_of_times.with(:meta).and_return(@attrs)
    @beer.meta.should == 'loaded'
  end
end