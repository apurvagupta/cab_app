class SupportCenterController < ApplicationController
  def index

    admin                 = Admin.where(status: true).first
    @admin_name           = admin.name
    @admin_contact_number = admin.contact_no

    vendor                 = Vendor.where(status: true).first
    @vendor_name           = vendor.name
    @vendor_contact_number = vendor.contact_no

    if !@admin_name || !@vendor_name
      redirect_to '/support_center/edit'
    end
  end

  def update
    admin = Admin.where(name: params[:admin]).first
    update_status(admin)

    vendor = Vendor.where(name: params[:vendor]).first
    update_status(vendor)
    redirect_to support_center_index_path
  end

  def edit
    @admin_array  = Admin.all
    @vendor_array = Vendor.all
  end


  def update_status(active_support_person)
    if active_support_person.class == Admin
      support_persons = Admin.all
    else
      support_persons = Vendor.all
    end
    support_persons.each do |support_person|
      if (support_person.name == active_support_person.name)
        support_person.update_attribute(:status, 'true')
      else
        support_person.update_attribute(:status, 'false')
      end
    end
  end

  def show
    p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@1111"
    p params


    if params[:from]
     from_date  = Time.new(params[:from].to_date.year,params[:from].to_date.month,params[:from].to_date.day,00,00,00)
     to_date    = Time.new(params[:to].to_date.year,params[:to].to_date.month,params[:to].to_date.day,00,00,00).tomorrow()
     @cab_requests = CabRequest.where(:pick_up_date_time => (from_date..to_date))
     @dates        = []
     @cab_requests.each do |cab_request|
       @dates.push cab_request.pick_up_date_time.to_date
     end
    @from = params[:from]
    @to   = params[:to]
    end
    respond_to do |format|
      format.html
      format.xls
    end
  end

end
