require "spec_helper"

describe MarshaledAttributes do
  it "should not raise with blank values" do
    beer = Beer.create!(:name => "Duffys")

    expect {
      beer.meta = nil
      beer.meta.should == nil

      beer.meta = ""
      beer.meta.should == ""
    }.to_not raise_error
  end

  it "should marshal using writer" do
    expect {
      beer = Beer.create!
      beer.meta = {:color => :dark}
      beer.save!
      beer.reload
      beer.meta.should == {:color => :dark}
    }.to_not raise_error
  end

  it "should marshal using mass-assignment" do
    beer = Beer.create!(:meta => {:color => :dark})
    beer.reload
    beer.meta.should == {:color => :dark}
  end
end
