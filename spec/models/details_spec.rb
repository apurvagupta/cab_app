require 'spec_helper'

describe Details do
       
  before :each do
    @details = Details.new :support_phone_no => "1234567890", :vendor_phone_no => "0987654321", :assigned_admins => "sample"
  end

  context "Class structure validations" do

    it "should have all required fields  " do
      (@details.has_attribute? :support_phone_no).should be_true
      (@details.has_attribute? :vendor_phone_no).should be_true
      (@details.has_attribute? :assigned_admins).should be_true
    end

  end
  
  context "Support Phone number " do

    it "should not be blank" do
      @details.support_phone_no = nil
      @details.save.should be_false
      @details.errors[:support_phone_no].first.should == "can't be blank"
    end

    it "should not contain non-numeric data" do
      @details.support_phone_no = "a$$@7466748"
      @details.save.should be_false
      @details.errors[:support_phone_no].first.should == "is not a number"
    end

    it "should not contain more or less than ten digits" do
      @details.support_phone_no = "45678"
      @details.save.should be_false
      @details.errors[:support_phone_no].first.should == "is the wrong length (should be 10 characters)"
    end

  end

  context "Vendor Phone number " do

    it "should not be blank" do
      @details.vendor_phone_no = nil
      @details.save.should be_false
      @details.errors[:vendor_phone_no].first.should == "can't be blank"
    end

    it "should not contain non-numeric data" do
      @details.vendor_phone_no = "a$$@7466748"
      @details.save.should be_false
      @details.errors[:vendor_phone_no].first.should == "is not a number"
    end

    it "should not contain more or less than ten digits" do
      @details.vendor_phone_no = "45678"
      @details.save.should be_false
      @details.errors[:vendor_phone_no].first.should == "is the wrong length (should be 10 characters)"
    end

   end


  context "assigned admins" do

    it "should not be null" do
      @details.assigned_admins = nil
      @details.save.should be_false
    end

    it "should not contain digits" do
      @details.assigned_admins = "hello1223"
      @details.save.should be_false
    end

  end

end

