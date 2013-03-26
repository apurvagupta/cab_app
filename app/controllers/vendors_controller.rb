# -*- encoding : utf-8 -*-
class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def new
    @info = Vendor.new
  end

  def edit
    @info = Vendor.find(params[:id])
  end

  def create
    @info = Vendor.new(params[:vendor])

    if @info.save
      redirect_to vendors_path
    else
      render action: 'new'
    end

  end

  def update
    @info = Vendor.find(params[:id])

    if @info.update_attributes(params[:vendor])
      redirect_to vendors_path
    else
      render action: 'edit'
    end

  end

  def destroy
    @info = Vendor.find(params[:id])
    @info.destroy
    redirect_to vendors_path
  end

end
