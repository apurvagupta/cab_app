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
      controller.instance_variable_get(:@admins).should == @sample_admins
    end
  end

  context 'new' do
    it 'should create empty Admin object' do
      post :new
      controller.instance_variable_get(:@info)[:name] == nil
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
end