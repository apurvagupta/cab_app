require 'spec_helper'

describe AdminsController do
  before :each do
    CASClient::Frameworks::Rails::Filter.fake("homer")
    @sample_admin = Admin.create(name: 'pulkitko', contact_no: "8765432100", status: true)
    @sample_admin2 = Admin.create(name: 'ppathak', contact_no: "8765432100", status: false)
    @sample_admins = [@sample_admin,@sample_admin2]
  end
  context 'index' do
    it 'should get list of admins' do
      get :index
      assigns(:admins).should == @sample_admins
    end
  end

  context 'new' do
    it 'should create empty Admin object' do
      admin2=Admin.new
      Admin.should_receive(:new).and_return(admin2)
      get :new
      assigns(:info).should == admin2
    end
  end

  context 'edit' do
    it 'should get the correct admin' do
      get :edit, id: @sample_admin.id
      assigns(:info).should == @sample_admin
    end
  end

  context 'create' do
    it 'should redirect to admins_path on successful save' do
      new_admin = {name: 'pulkitko', contact_no: "8765432100", status: false}
      post :create, admin: new_admin
      response.should redirect_to(admins_path)
    end

   it 'should render new on failed save' do
      new_admin = {name: 'pulkitko', contact_no: "876543210", status: false}
      post :create, admin: new_admin
      response.should render_template('admins/new')
   end 
  end

  context 'update' do
    it 'should successfully update admin' do
      updated_admin = {name: 'pulkitko', contact_no: "8765432199", status: false}
      put :update, id: @sample_admin.id, admin: updated_admin
      assigns(:info)[:contact_no].should == updated_admin[:contact_no]
    end

    it 'should redirect to admins_path on successful update' do
      updated_admin = {name: 'pulkitko', contact_no: "8765432199", status: false}
      put :update, id: @sample_admin.id, admin: updated_admin
      response.should redirect_to(admins_path)
    end

    it 'should render edit update failure' do
      updated_admin = {name: 'pulkitko', contact_no: "87654321", status: false}
      put :update, id: @sample_admin.id, admin: updated_admin
      response.should render_template('admins/edit')
    end
  end

  context 'destroy' do
    it 'should delete given admin' do
      delete :destroy, id:@sample_admin.id
      Admin.all.should_not == @sample_admins
    end
    it 'should redirect to admins_path on successful delete.' do
      delete :destroy, id:@sample_admin.id
      response.should redirect_to(admins_path)
    end 
  end

end