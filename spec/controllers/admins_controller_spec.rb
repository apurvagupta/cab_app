require 'spec_helper'

describe AdminsController do
  before :each do
    CASClient::Frameworks::Rails::Filter.fake('homer')
    @sample_admin = create(:admin)
    @sample_admin2 = create(:inactive_valid_admin)
    @sample_admins = [@sample_admin, @sample_admin2]
  end
  context 'index' do
    it 'should get list of admins' do
      get :index
      controller.instance_variable_get(:@admins).should == @sample_admins
    end
  end

  context 'new' do
    it 'should create empty Admin object' do
      empty_admin_object = Admin.new
      Admin.should_receive(:new).and_return(empty_admin_object)
      get :new
      controller.instance_variable_get(:@info).should == empty_admin_object
    end
  end

  context 'edit' do
    it 'should get the correct admin' do
      get :edit, id: @sample_admin.id
      controller.instance_variable_get(:@info).should == @sample_admin
    end
  end

  context 'create' do
    it 'should redirect to admins_path on successful save' do
      new_admin = attributes_for(:inactive_valid_admin)
      post(:create, admin: new_admin).should redirect_to(admins_path)
    end

    it 'should render new on failed save' do
      new_admin = attributes_for(:invalid_admin)
      post(:create, admin: new_admin).should render_template('admins/new')
    end
  end

  context 'update' do
    it 'should successfully update admin' do
      updated_admin = attributes_for(:inactive_valid_admin, name: 'cooga')
      put :update, id: @sample_admin.id, admin: updated_admin
      controller.instance_variable_get(:@info)[:contact_no].should == updated_admin[:contact_no]
    end

    it 'should redirect to admins_path on successful update' do
      updated_admin = attributes_for(:inactive_valid_admin, name: 'cooga')
      put(:update, id: @sample_admin.id, admin: updated_admin).should redirect_to(admins_path)
    end

    it 'should render edit update failure' do
      updated_invalid_admin = attributes_for(:admin, contact_no: '8765432')
      put(:update, id: @sample_admin.id, admin: updated_invalid_admin).should render_template('admins/edit')
    end
  end

  context 'destroy' do
    it 'should delete given admin' do
      delete :destroy, id: @sample_admin.id
      Admin.all.should_not == @sample_admins
    end
    it 'should redirect to admins_path on successful delete.' do
      delete(:destroy, id: @sample_admin.id).should redirect_to(admins_path)
    end
  end

end