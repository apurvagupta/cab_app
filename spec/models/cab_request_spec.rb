require 'spec_helper'

describe CabRequest do

  before :each do
    @cab_request = CabRequest.new :phone_no => "8527644166" , :destination => "Udyog Vihar", :drop_time => "05:30" , :comments => "Please consider my request"
  end

  context "Class structure validations" do

    it "should have all required fields  " do
      (@cab_request.has_attribute? :phone_no).should be_true
      (@cab_request.has_attribute? :destination).should be_true
      (@cab_request.has_attribute? :drop_time).should be_true
      (@cab_request.has_attribute? :comments).should be_true
      #(@cab_request.)
    end

  end

  context "all mandatory fields" do

    it "should contain a value" do
      @cab_request.save.should be_true
    end

  end

  context "Phone number " do

    it "should not be blank" do
      @cab_request.phone_no = nil
      @cab_request.save.should be_false
      @cab_request.errors[:phone_no].first.should == "can't be blank"
    end

    it "should not contain non-numeric data" do
      @cab_request.phone_no = "a$$@7466748"
      @cab_request.save.should be_false
      @cab_request.errors[:phone_no].first.should == "is not a number"
    end

    it "should not contain more or less than ten digits" do
      @cab_request.phone_no = "45678"
      @cab_request.save.should be_false
      @cab_request.errors[:phone_no].first.should == "is the wrong length (should be 10 characters)"
    end

  end

  context "Destination" do

    it "should not be blank" do
      @cab_request.destination = nil
      @cab_request.save.should be_false
      @cab_request.errors[:destination].first.should == "can't be blank"
    end

  end

  context "Drop Time" do

    it "should not be blank" do
      @cab_request.drop_time = nil
      @cab_request.save.should be_false
      @cab_request.errors[:drop_time].first.should == "can't be blank"
    end

  end

  context "Comments" do

    it "should not contain more than 100 characters" do
      @cab_request.comments = "hello"*21
      @cab_request.save.should be_false
      @cab_request.errors[:comments].first.should == "is too long (maximum is 100 characters)"
    end
  end

end