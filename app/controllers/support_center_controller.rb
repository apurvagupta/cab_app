class SupportCenterController < ApplicationController
  def index
    @vendor_names = Vendor.all.collect(&:name)
    @vendor_contact_numbers = Vendor.all.collect(&:contact_no)

    @admin_names = Admin.all.collect(&:name)
    @admin_contact_numbers = Admin.all.collect(&:contact_no)

  end

  def update
    p "3355555555555555555555555555555222222222222222222222222222222225555555555555555555553222222221111qqqqqqdddddd"
    p params

    redirect_to support_center_index_path
  end
end