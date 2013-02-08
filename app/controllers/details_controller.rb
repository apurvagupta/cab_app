class DetailsController < ApplicationController

  def create

    @detail = Detail.new(params[:detail])
    @detail.save

  end


  def update

    @detail = Detail.find(params[:id])
    @detail.update_attributes(params[:detail])

  end

end