require 'spec_helper'

describe CabRequest do

  before :all do
    @cab_request = CabRequest.new
  end
  context "" do

  end
  it "should have all required fields  " do
    (@cab_request.has_attribute? :phone_no).should be_true
    (@cab_request.has_attribute? :destination).should be_true
    (@cab_request.has_attribute? :drop_time).should be_true
    (@cab_request.has_attribute? :comments).should be_true
  end

    it "should not be blank" do
      @cab_request.save.should  be_false
      @cab_request.errors[:phone_no].first.should == "can't be blank"
      @cab_request.errors[:destination].first.should == "can't be blank"
      @cab_request.errors[:drop_time].first.should == "can't be blank"

    end

    it "should have mandatory fields present" do
      #@cab_request.

    end


end