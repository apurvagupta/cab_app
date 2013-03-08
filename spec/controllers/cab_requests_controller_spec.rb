require 'spec_helper'

describe CabRequestsController do



  before :each do
    @pick_up_date_time = Time.now + 2.days
    @cab_request  = { requester: "Priyanka Pathak", traveler_name: "self",pick_up_date: @pick_up_date_time.to_date,
                      pick_up_date_time: @pick_up_date_time, contact_no: "9039409828",
                      source: "Guest House", destination: "ThoughtWorks", no_of_passengers: 1, comments: "something" }
  end
  context 'create' do
    it 'should redirect to show path if saved' do

      CASClient::Frameworks::Rails::Filter.fake("homer")
      post :create, cab_request: @cab_request

      response.should redirect_to ("/cab_requests/show")
    end

    it 'should render new cab request template if not saved' do
      CASClient::Frameworks::Rails::Filter.fake("homer")
      post :create
      response.should render_template("cab_requests/new")
    end
  end

  context 'show' do
    it 'should render html page' do
       @cab_requests = [@cab_request]
       @dates = [@pick_up_date_time.to_date]
       get :show,format: "html", cab_requests: @cab_requests, dates: @dates
       response.should render_template("cab_requests/show")
    end

    it 'should download xls file' do
      @cab_requests = [@cab_request]
      @dates = [@pick_up_date_time.to_date]
      get :show,format: "xls", cab_requests: @cab_requests, dates: @dates
      response.should render_template("cab_requests/show")
    end
  end
end
