class AdminsController < ApplicationController

  def index
    configure_details
  end

  def configure_details

    if Detail.all == []
      @detail=Detail.new
    else
      @detail=Detail.all
    end

  end



end

