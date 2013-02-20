class RequestersController < ApplicationController

  def index
    create_request
  end

  def create_request
    redirect_to new_cab_request_path
  end

  def logout
    cookies.delete :auth_token
    reset_session
    CASClient::Frameworks::Rails::Filter.logout(self)
  end

end