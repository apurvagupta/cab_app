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

  context "new" do
    it "should create a new Vendor" do
      vendor2=Vendor.new
      Vendor.should_receive(:new).and_return(vendor2)
      get :new
      response.should be_success
      assigns(:info).should == vendor2
    end
    it "should renders the new view " do
      get :new
      response.should render_template("vendors/new")
    end
  end

  context "Edit" do
    it "should find a particular Vendor" do
      get :edit ,id: @vendor1.id
      response.should be_success
      assigns(:info).should == @vendor1
    end
    it "should renders the edit view " do
      get :edit,id: @vendor1.id
      response.should render_template("vendors/edit")
    end
  end

  context "create" do
    it "should redirect to the index page when saved" do
      new_vendor = {name: 'sushil', contact_no: "8765432100", status: false}
      post :create ,vendor: new_vendor
      response.should redirect_to(vendors_path)
    end
    it "should render new when not saved" do
      new_vendor = {name: 'sushil', contact_no: "8765432", status: false}
      post :create ,vendor: new_vendor
      response.should render_template("vendors/new")
    end
  end

  context "update" do
    it "should redirect to index page when updated " do
      new_vendor = {name: 'sushil', contact_no: "8765432100", status: false}
      put :update, id: @vendor1.id , vendor: new_vendor
      response.should redirect_to(vendors_path)
    end
    it "should render edit when not updated" do
      new_vendor = {name: 'sushil', contact_no: "87654100", status: false}
      put :update ,id: @vendor1.id, vendor: new_vendor
      response.should render_template("vendors/edit")
    end
  end

  context "destroy" do
    it "should redirect to index page when deleted " do
      delete :destroy, id: @vendor1.id
      response.should redirect_to(vendors_path)
    end
  end

end
