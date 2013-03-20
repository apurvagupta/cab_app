require 'spec_helper'

describe CabRequestsController do

  before :each do


    CASClient::Frameworks::Rails::Filter.fake('homer')
    pick_up_date_time = Time.now + 2.days
    @valid_request_hash  = { requester: 'homer', traveler_name: 'self',pick_up_date: pick_up_date_time.to_date,
                      pick_up_date_time: pick_up_date_time, contact_no: '9039409828',
                      source: 'Guest House', destination: 'ThoughtWorks', no_of_passengers: 1, comments: 'something' }
    @valid_request = CabRequest.create!( @valid_request_hash )
  end

  context 'new' do
    it 'should create a valid cab request' do
      get :new, cab_request: @valid_request_hash
      response.should render_template('cab_requests/new')
    end
  end

  context 'create' do
    it 'should redirect to show path if saved' do
      post :create, cab_request: @valid_request_hash
      response.should redirect_to ('/cab_requests/show')
    end

    it 'should render new cab request template if not saved' do
      invalid_request_hash = @valid_request_hash.merge(contact_no: '0987654')
      post :create , cab_request: invalid_request_hash
      response.should render_template('cab_requests/new')
    end

    it 'should pick other_source when source == others' do
      @valid_request_hash.merge!(source: 'other')
      post :create, cab_request: @valid_request_hash, source: 'Dilshad Garden'
      controller.instance_variable_get(:@cab_request)[:source].should == 'Dilshad Garden'
    end

    it 'should pick other_destination when destination == others' do
      @valid_request_hash.merge!(destination: 'other')
      post :create, cab_request: @valid_request_hash, destination: 'Rajouri Gardens'
      controller.instance_variable_get(:@cab_request)[:destination].should == 'Rajouri Gardens'
    end
  end

  context 'show' do
    it 'should assign CabRequest data to @cab_requests' do
      get :show, requester: @valid_request.requester
      assigns(:cab_requests).should == [@valid_request]
    end

    it 'should render html page' do
       @cab_requests = [@valid_request_hash]
       get :show,format: 'html'
       controller.instance_variable_get(:@dates).should include(@cab_requests[0][:pick_up_date_time].to_date)
       response.should render_template('cab_requests/show')
    end

    it 'should download xls file' do
      @cab_requests = [@valid_request_hash]
      get :show,format: 'xls'
      controller.instance_variable_get(:@dates).should include(@cab_requests[0][:pick_up_date_time].to_date)
      response.should render_template('cab_requests/show')
    end
  end
end
