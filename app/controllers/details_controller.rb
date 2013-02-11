class DetailsController < ApplicationController

  def create

    @detail = Detail.new(params[:detail])
    @detail.save
    redirect_to cab_requests_path

  end


  def update

    @detail = Detail.find(params[:id])
    @detail.update_attributes(params[:detail])
    redirect_to cab_requests_path

  end

end