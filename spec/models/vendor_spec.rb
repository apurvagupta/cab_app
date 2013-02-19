require 'spec_helper'

describe Vendor do
       
  before :each do
    @vendor = Vendor.new(:name => "sample", :contact_no => "1234567890", :status => false)
  end

  context "Class structure validations" do

    it "should have all required fields  " do
      (@vendor.has_attribute? :name).should be_true
      (@vendor.has_attribute? :contact_no).should be_true
    end

  end

  context "all mandatory fields" do

    it "should contain a value" do
      @vendor.save.should be_true
    end

  end

  context "vendor name" do

    it "should not be blank" do
      @vendor.name= nil
      @vendor.save.should be_false
    end

    it "should not contain digits" do
      @vendor.name= "hello@123"
      @vendor.save.should be_false
    end

  end
  
  context "vendor contact number " do

    it "should not be blank" do
      @vendor.contact_no = nil
      @vendor.save.should be_false
      @vendor.errors[:contact_no].first.should == "can't be blank"
    end

    it "should not contain non-numeric data" do
      @vendor.contact_no = "a$$@7466748"
      @vendor.save.should be_false
      @vendor.errors[:contact_no].first.should == "is not a number"
    end

    it "should not contain more or less than ten digits" do
      @vendor.contact_no = "45678"
      @vendor.save.should be_false
      @vendor.errors[:contact_no].first.should == "is the wrong length (should be 10 characters)"
    end

  end

end





















