class CabRequestsController < ApplicationController



  #def admin_names
  #
  #  @admin_detail = AdminDetail.first
  #  @admin_array=[]
  #  extract_admin_names(@admin_detail.assigned_admins)
  #
  #end
  #
  #def extract_admin_names(admins)
  #
  #  @comma_index = admins.index(',')
  #
  #  if @comma_index == nil
  #
  #    @admin_array.push((admins.strip).downcase)
  #
  #  else
  #
  #    @admin_name = (admins[0 , @comma_index].strip).downcase
  #    @admin_array.push(@admin_name)
  #    admins = admins[@comma_index+1 , admins.length]
  #    extract_admin_names(admins)
  #
  #  end
  #
  #end

  def new
    @cab_request = CabRequest.new
    @req = Requester.new      
    @req.fetch_requester_info(session[:cas_user])
    @cab_request.init(@req.requester_name , @req.requester_contact_no)
  end


  def create
    # binding.pry
    @cab_request=CabRequest.new(params[:cab_request])
    @cab_request.pick_up_time = "#{params[:hours]}:#{params[:minutes]} #{params[:ampm]}"
    if @cab_request.save
      redirect_to cab_request_path(@cab_request)
    else
      render :template => "cab_requests/new"
    end
  end

  def show
    @cab_request=CabRequest.find(params[:id])
    @cab_request_array=CabRequest.all(:conditions => {:requester => @cab_request.requester})
  end

end
