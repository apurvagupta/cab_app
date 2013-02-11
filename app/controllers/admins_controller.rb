class AdminsController < ApplicationController

  def index
    configure_details
  end

  def configure_details

    if AdminDetail.all == []
      @detail=AdminDetail.new
    else
      @detail=AdminDetail.all
    end

  end



end

