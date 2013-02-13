class AdminDetailsController < ApplicationController


  def update

    @admin_detail = AdminDetail.find(params[:id])
    if @admin_detail.update_attributes(params[:admin_detail])
      redirect_to cab_requests_path
    else
      render :template => "admins/index"
    end

  end

end