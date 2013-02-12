class AdminsController < ApplicationController

  def index
    configure_details
  end

  def configure_details

      @admin_detail=AdminDetail.all

  end

end



