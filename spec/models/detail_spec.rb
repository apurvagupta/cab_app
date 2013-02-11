require 'spec_helper'

describe Detail do
       
  before :each do
    @detail = Detail.new :support_phone_no => "1234567890", :vendor_phone_no => "0987654321", :assigned_admins => "sample"
  end

  context "Class structure validations" do

    it "should have all required fields  " do
      (@detail.has_attribute? :support_phone_no).should be_true
      (@detail.has_attribute? :vendor_phone_no).should be_true
      (@detail.has_attribute? :assigned_admins).should be_true
    end

  end
  
  context "Support Phone number " do

    it "should not be blank" do
      @detail.support_phone_no = nil
      @detail.save.should be_false
      @detail.errors[:support_phone_no].first.should == "can't be blank"
    end

    it "should not contain non-numeric data" do
      @detail.support_phone_no = "a$$@7466748"
      @detail.save.should be_false
      @detail.errors[:support_phone_no].first.should == "is not a number"
    end

    it "should not contain more or less than ten digits" do
      @detail.support_phone_no = "45678"
      @detail.save.should be_false
      @detail.errors[:support_phone_no].first.should == "is the wrong length (should be 10 characters)"
    end

  end

  context "Vendor Phone number " do

    it "should not be blank" do
      @detail.vendor_phone_no = nil
      @detail.save.should be_false
      @detail.errors[:vendor_phone_no].first.should == "can't be blank"
    end

    it "should not contain non-numeric data" do
      @detail.vendor_phone_no = "a$$@7466748"
      @detail.save.should be_false
      @detail.errors[:vendor_phone_no].first.should == "is not a number"
    end

    it "should not contain more or less than ten digits" do
      @detail.vendor_phone_no = "45678"
      @detail.save.should be_false
      @detail.errors[:vendor_phone_no].first.should == "is the wrong length (should be 10 characters)"
    end

   end


  context "assigned admins" do

    it "should not be null" do
      @detail.assigned_admins = nil
      @detail.save.should be_false
    end

    it "should not contain digits" do
      @detail.assigned_admins = "hello1223"
      @detail.save.should be_false
    end

  end

end

