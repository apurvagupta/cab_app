class RequestersController < ApplicationController


  def logout
    cookies.delete :auth_token
    reset_session
    CASClient::Frameworks::Rails::Filter.logout(self)
  end

end