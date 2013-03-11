require 'spec_helper'

describe CabRequestsController do

  before :each do


    CASClient::Frameworks::Rails::Filter.fake("homer")
    @pick_up_date_time = Time.now + 2.days
    @cab_request  = { requester: "homer", traveler_name: "self",pick_up_date: @pick_up_date_time.to_date,
                      pick_up_date_time: @pick_up_date_time, contact_no: "9039409828",
                      source: "Guest House", destination: "ThoughtWorks", no_of_passengers: 1, comments: "something" }
    CabRequest.create!(requester: "homer", traveler_name: "self",pick_up_date_time: Time.now + 2.days,
                       contact_no: "9039409828",source: "Guest House", destination: "ThoughtWorks",
                       no_of_passengers: 1, comments: "something", pick_up_date: (Time.now + 2.days).to_date )
  end

  context 'new' do
    it 'should create a valid cab request' do
      get :new, cab_request: @cab_request
      response.should render_template("cab_requests/new")
    end
  end

  context 'create' do
    it 'should redirect to show path if saved' do
      post :create, cab_request: @cab_request
      response.should redirect_to ("/cab_requests/show")
    end

    it 'should render new cab request template if not saved' do
      post :create
      response.should render_template("cab_requests/new")
    end

    it 'should pick other_source when source == others' do
      @cab_request.merge!(source: 'other')
      post :create, cab_request: @cab_request, source: 'Dilshad Garden'
      controller.instance_variable_get(:@cab_request)[:source].should == 'Dilshad Garden'
    end

    it 'should pick other_destination when destination == others' do
      @cab_request.merge!(destination: 'other')
      post :create, cab_request: @cab_request, destination: 'Rajouri Gardens'
      controller.instance_variable_get(:@cab_request)[:destination].should == 'Rajouri Gardens'
    end
  end

  context 'show' do

    it 'should render html page' do
       @cab_requests = [@cab_request]
       get :show,format: "html"
       controller.instance_variable_get(:@dates).should include(@cab_requests[0][:pick_up_date_time].to_date)
       response.should render_template("cab_requests/show")
    end

    it 'should download xls file' do
      @cab_requests = [@cab_request]
      get :show,format: "xls"
      controller.instance_variable_get(:@dates).should include(@cab_requests[0][:pick_up_date_time].to_date)
      response.should render_template("cab_requests/show")
    end
  end
end
