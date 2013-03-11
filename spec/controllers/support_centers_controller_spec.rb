require 'spec_helper'

describe SupportCentersController do
  context "index" do
    before do
      CASClient::Frameworks::Rails::Filter.fake("homer")
      @admin            = Admin.new
      @admin.name       = "tina"
      @admin.contact_no = "1234567890"
      @admin.status     = true
      @admin.save!
      @vendor            = Vendor.new
      @vendor.name       = "tina"
      @vendor.contact_no = "1234567890"
      @vendor.status     = true
      @vendor.save!

    end

    it "should assign requested Admin data to @admin" do
      get :index
      response.should be_success
      assigns(:admin).should == @admin
      assigns(:vendor).should == @vendor
    end

    it "should only "

  end

end