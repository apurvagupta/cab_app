class RequestersController < ApplicationController

  def index
    create_request
  end

end

  def create_request

   redirect_to new_cab_request_path

  end
