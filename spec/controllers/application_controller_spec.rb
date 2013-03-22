require 'spec_helper'

describe ApplicationController do
  # This is the anonymous controller:
  controller do
    def new
      render text: 'Hello'
    end
  end

  it 'should redirect to CAS login page if user is not logged in' do
    get :new
    unless session[:cas_sent_to_gateway].nil?
      response.should redirect_to('https://cas.thoughtworks.com/cas/login?service=http%3A%2F%2Ftest.host%2Fanonymous%2Fnew')
    end
  end

  it 'should redirect to new request page if user is logged in' do
    CASClient::Frameworks::Rails::Filter.fake('homer')
    get :new
    response.should be_success
  end

  it 'should fetch user info from JSON string' do
    expected_info = Requester.new
    expected_info.requester_name = 'ooga'
    expected_info.requester_contact_no = '1234567890'
    $response = '{ "name" : "ooga", "profile" :  { "mobile" : "1234567890"}}'
    controller = ApplicationController.new
    actual_info = controller.fetch_requester_info
    get :new
    result = expected_info.requester_name == actual_info.requester_name && expected_info.requester_contact_no == actual_info.requester_contact_no
    result.should  be_true
  end

end

