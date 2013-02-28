class SupportCenterController < ApplicationController
  def index
    @admin_name = Admin.all(:conditions => {:status => true}).pop.name
    @admin_contact_number = Admin.all(:conditions => {:name => @admin_name}).pop.contact_no
    @vendor_name = Vendor.all(:conditions => {:status => true}).pop.name
    @vendor_contact_number = Vendor.all(:conditions => {:name => @vendor_name}).pop.contact_no
    if !@admin_name || !@vendor_name
      redirect_to '/support_center/edit'
    end

  end

  def update
    admin = Admin.all(:conditions => {:name => params[:admin]}).pop
    update_status(admin)

    vendor = Vendor.all(:conditions => {:name => params[:vendor]}).pop
    update_status(vendor)
    redirect_to support_center_index_path
  end

  def edit
     @admin_names = Admin.all.collect(&:name)
     @admin_contact_numbers = Admin.all.collect(&:contact_no)

     @vendor_names = Vendor.all.collect(&:name)
     @vendor_contact_numbers = Vendor.all.collect(&:contact_no)
  end

  def update_status(active_support_person)
    if active_support_person.class == Admin
      support_persons = Admin.all
    else
      support_persons = Vendor.all
    end
     support_persons.each do |support_person|
      if(support_person.name == active_support_person.name)
        support_person.update_attribute(:status,'true')
      else
        support_person.update_attribute(:status,'false')
      end
    end
  end




end