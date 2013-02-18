 class VendorsController < ApplicationController
 def new
  	@info = Vendor.new
  end

  def edit
  	@info = Vendor.find(params[:id])
  end

  def create
  	@info = Vendor.new(params[:vendor])

  	if @info.save
  		redirect_to cab_requests_path
  	end

  end

  def update
  	@info = Vendor.find(params[:id])

  	if @info.update_attributes(params[:info])
  		redirect_to cab_requests_path
  	end

  end
end