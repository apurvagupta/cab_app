require 'spec_helper'

describe VendorsController do
  before :each do
    CASClient::Frameworks::Rails::Filter.fake("homer")
    @vendor1 = Vendor.create(name: "sushil", contact_no: "1234567890", status:"true")
  end
  context "Index" do
    it "should populate array of vendor" do
      get :index
      response.should be_success
      assigns(:vendors).should == [@vendor1]
    end
    it "should renders the index view" do
      get :index
      response.should render_template("vendors/index")
    end
  end

  context "New" do

    it "Assign all attributes to new Vendor" do
      vendor2=Vendor.new
      get :new
      response.should be_success
      assigns(:info).eql?(vendor2) == true
    end
    it "should renders the new view " do
      get :new
      response.should render_template("vendors/new")
    end
  end

end
