class AdminDetailsController < ApplicationController


  def update

    @admin_detail = AdminDetail.find(params[:id])
    @admin_detail.update_attributes(params[:admin_detail])
    redirect_to cab_requests_path

  end

end