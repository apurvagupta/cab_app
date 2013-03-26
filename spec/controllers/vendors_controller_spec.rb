require 'spec_helper'

describe VendorsController do
  before :each do
    CASClient::Frameworks::Rails::Filter.fake('homer')
    @active_valid_vendor = create(:vendor)
  end

  context 'Index' do
    it 'should populate array of vendor' do
      get :index
      response.should be_success
      controller.instance_variable_get(:@vendors).should == [@active_valid_vendor]
    end
    it 'should renders the index view' do
      get(:index).should render_template('vendors/index')
    end
  end

  context 'new' do
    it 'should create a new Vendor' do
      new_vendor = Vendor.new
      Vendor.should_receive(:new).and_return(new_vendor)
      get(:new).should be_success
      controller.instance_variable_get(:@info).should == new_vendor
    end
    it 'should render the new view ' do
      get(:new).should render_template('vendors/new')
    end
  end

  context 'Edit' do
    it 'should find a particular Vendor' do
      get(:edit ,id: @active_valid_vendor.id).should be_success
      controller.instance_variable_get(:@info).should == @active_valid_vendor
    end
    it 'should render the edit view ' do
      get(:edit,id: @active_valid_vendor.id).should render_template('vendors/edit')
    end
  end

  context 'create' do
    it 'should redirect to the index page when saved' do
      post(:create ,vendor: attributes_for(:inactive_valid_vendor)).should redirect_to(vendors_path)
    end
    it 'should render new when not saved' do
      post(:create ,vendor: attributes_for(:invalid_vendor)).should render_template('vendors/new')
    end
  end

  context 'update' do
    it 'should redirect to index page when updated ' do
      put(:update, id: @active_valid_vendor.id , vendor: attributes_for(:vendor, contact_no: '1234567890')).should redirect_to(vendors_path)
    end
    it 'should render edit when not updated' do
      put(:update ,id: @active_valid_vendor.id, vendor: attributes_for(:invalid_vendor)).should render_template('vendors/edit')
    end
  end

  context 'destroy' do
    it 'should redirect to index page when deleted ' do
      delete(:destroy, id: @active_valid_vendor.id).should redirect_to(vendors_path)
    end
  end
end
