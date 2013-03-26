require 'spec_helper'

describe CabRequestsController do

  before :each do
    CASClient::Frameworks::Rails::Filter.fake('obama')
    @valid_request_hash = attributes_for(:cab_request)
  end

  context 'index' do
    it 'should redirect to new cab request page' do
      get(:index).should redirect_to '/cab_requests/new'
    end
  end

  context 'new' do
    it 'should create a valid cab request' do
      get(:new, cab_request: @valid_request_hash).should render_template('cab_requests/new')
    end
  end

  context 'create' do
    it 'should redirect to show path if saved' do
      post(:create, cab_request: @valid_request_hash).should redirect_to ('/cab_requests/show')
    end

    it 'should render new cab request template if not saved' do
      post(:create , cab_request: attributes_for(:cab_request, contact_no: '098765')).should render_template('cab_requests/new')
    end

    it 'should pick other_source when source == others' do
      post :create, cab_request: attributes_for(:cab_request, source: 'other'), source: 'Dilshad Garden'
      controller.instance_variable_get(:@cab_request)[:source].should == 'Dilshad Garden'
    end

    it 'should pick other_destination when destination == others' do
      post :create, cab_request: attributes_for(:cab_request, destination: 'other'), destination: 'Rajouri Gardens'
      controller.instance_variable_get(:@cab_request)[:destination].should == 'Rajouri Gardens'
    end
  end

  context 'show' do

    before(:each) do
      @valid_request = create(:cab_request)
    end
    it 'should assign CabRequest data to @cab_requests' do

      get :show, requester: @valid_request_hash[:requester]
      controller.instance_variable_get(:@cab_requests).should == [@valid_request]
    end

    it 'should render html page' do
       get(:show,format: 'html').should render_template('cab_requests/show')
       controller.instance_variable_get(:@dates).should include @valid_request_hash[:pick_up_date_time].to_date
    end

    it 'should download xls file' do
      @cab_requests = [attributes_for(:cab_request)]
      get(:show,format: 'xls').should render_template('cab_requests/show')
      controller.instance_variable_get(:@dates).should include @valid_request_hash[:pick_up_date_time].to_date
      
    end
  end
end
