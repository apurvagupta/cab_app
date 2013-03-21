require 'spec_helper'

describe VendorsController do
  before :each do
    CASClient::Frameworks::Rails::Filter.fake('homer')
    @vendor_hash = {name: 'sushil', contact_no: '1234567890', status:'true'}
    @vendor = Vendor.create(@vendor_hash)
  end

  context 'Index' do
    it 'should populate array of vendor' do
      get :index
      response.should be_success
      controller.instance_variable_get(:@vendors).should == [@vendor]
    end
    it 'should renders the index view' do
      get :index
      response.should render_template('vendors/index')
    end
  end

  context 'new' do
    it 'should create a new Vendor' do
      new_vendor = Vendor.new
      Vendor.should_receive(:new).and_return(new_vendor)
      get :new
      response.should be_success
      controller.instance_variable_get(:@info).should == new_vendor
    end
    it 'should render the new view ' do
      get :new
      response.should render_template('vendors/new')
    end
  end

  context 'Edit' do
    it 'should find a particular Vendor' do
      get :edit ,id: @vendor.id
      response.should be_success
      controller.instance_variable_get(:@info).should == @vendor
    end
    it 'should render the edit view ' do
      get :edit,id: @vendor.id
      response.should render_template('vendors/edit')
    end
  end

  context 'create' do
    it 'should redirect to the index page when saved' do
      new_vendor_hash = @vendor_hash.merge!(name: 'tina',status: false)
      post :create ,vendor: new_vendor_hash
      response.should redirect_to(vendors_path)
    end
    it 'should render new when not saved' do
      invalid_vendor_hash = @vendor_hash.merge(contact_no: '12345')
      post :create ,vendor: invalid_vendor_hash
      response.should render_template('vendors/new')
    end
  end

  context 'update' do
    it 'should redirect to index page when updated ' do
      updated_vendor_hash = @vendor_hash.merge(status: false)
      put :update, id: @vendor.id , vendor: updated_vendor_hash
      response.should redirect_to(vendors_path)
    end
    it 'should render edit when not updated' do
      invalid_update_vendor_hash = @vendor_hash.merge(contact_no: '12345',status: false)
      put :update ,id: @vendor.id, vendor: invalid_update_vendor_hash
      response.should render_template('vendors/edit')
    end
  end

  context 'destroy' do
    it 'should redirect to index page when deleted ' do
      delete :destroy, id: @vendor.id
      response.should redirect_to(vendors_path)
    end
  end

end
