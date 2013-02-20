class SupportCenterController < ApplicationController
  def index
    @admin_name = Admin.all(:conditions => {:status => true}).pop.name
    @admin_contact_number = Admin.all(:conditions => {:name => @admin_name}).pop.contact_no

    @vendor_name = Vendor.all(:conditions => {:status => true}).pop.name
    @vendor_contact_number = Vendor.all(:conditions => {:name => @vendor_name}).pop.contact_no
  end

  def update
    @admin = Admin.all(:conditions => {:name => params[:admin]}).pop
    @admin.set_admin_status(params[:admin])

    @vendor = Vendor.all(:conditions => {:name => params[:vendor]}).pop
    @vendor.set_vendor_status(params[:vendor])
    redirect_to support_center_index_path
  end

  def edit
     @admin_names = Admin.all.collect(&:name)
     @admin_contact_numbers = Admin.all.collect(&:contact_no)

     @vendor_names = Vendor.all.collect(&:name)
     @vendor_contact_numbers = Vendor.all.collect(&:contact_no)
  end

end