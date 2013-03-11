require 'spec_helper'

describe SupportCentersController do

  before do
    CASClient::Frameworks::Rails::Filter.fake("homer")
    @admin            = Admin.new
    @admin.name       = "homer"
    @admin.contact_no = "1234567890"
    @admin.status     = true
    @admin.save!
    @vendor            = Vendor.new
    @vendor.name       = "tina"
    @vendor.contact_no = "1234567890"
    @vendor.status     = true
    @vendor.save!
  end

  context "index" do

    it "should assign requested Admin data to @admin" do
      get :index
      response.should be_success
      assigns(:admin).should == @admin
    end

    it "should assign requested Vendor data to @vendor" do
      get :index
      response.should be_success
      assigns(:vendor).should == @vendor
    end

  end

  context "update" do

    it "should assign requested Admin data to @admin" do
      put :update, admin: @admin.name, vendor: @vendor.name
      assigns(:admin).should == @admin
    end

    it "should assign requested Vendor data to @vendor" do
      put :update, admin: @admin.name, vendor: @vendor.name
      assigns(:vendor).should == @vendor
    end

    it "should redirect to index path" do
      put :update, admin: @admin.name, vendor: @vendor.name
      response.should redirect_to('/support_centers')
    end
  end

  context "edit" do

    it "should assign requested Admin data to @admins" do
      get :edit
      assigns(:admins).should == [@admin]
    end

    it "should assign requested Vendor data to @vendors" do
      get :edit
      assigns(:vendors).should == [@vendor]
    end
  end
end