# -*- encoding : utf-8 -*-
class SupportCentersController < ApplicationController

  def index
    @admin                 = Admin.where(status: true).first
    @vendor                = Vendor.where(status: true).first
  end

  def update
    admin = Admin.where(name: params[:admin]).first
    update_status(admin)

    vendor = Vendor.where(name: params[:vendor]).first
    update_status(vendor)
    redirect_to support_centers_path
  end

  def edit
    @admins  = Admin.all
    @vendors = Vendor.all
  end

  def show
    if params[:from]
      from_date  = Time.parse(date_time_parser(params[:from],'00:00:00'))
      to_date    = Time.parse(date_time_parser(params[:to],'00:00:00')).tomorrow()
      @cab_requests = CabRequest.where(pick_up_date_time: (from_date..to_date))
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

private
  def update_status(active_support_person)
    active_support_person_class = active_support_person.class
    support_persons = active_support_person_class.all
    support_persons.each do |support_person|
      if (support_person.name == active_support_person.name)
        support_person.update_attribute(:status, 'true')
      else
        support_person.update_attribute(:status, 'false')
      end
    end
  end

end
