class AdminDetailsController < ApplicationController


  def create

    @detail = AdminDetail.new(params[:detail])
    @detail.save
    redirect_to cab_requests_path

  end


  def update

    @detail = AdminDetail.find(params[:id])
    @detail.update_attributes(params[:detail])
    redirect_to cab_requests_path

  end

end