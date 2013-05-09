# -*- encoding : utf-8 -*-
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

  it 'should return true if the logged in user is admin' do
    session[:cas_user] = 'homer'
    Admin.create(name: 'homer', contact_no: '9876543212',email:'apurvagu@gmail.com' ,status: false)
    CASClient::Frameworks::Rails::Filter.fake('homer')
    get :new
    controller.instance_variable_get(:@is_admin).should == true
  end

  it 'should return false if the logged in user is not an admin' do
    CASClient::Frameworks::Rails::Filter.fake('homer')
    get :new
    controller.instance_variable_get(:@is_admin).should == false
  end
end

