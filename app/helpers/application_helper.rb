# -*- encoding : utf-8 -*-
module ApplicationHelper

  def ist(time)
    unless time.nil?
      time.in_time_zone(TZInfo::Timezone.get('Asia/Kolkata')).strftime('%I:%M %p')
    end
  end

  def is_admin?
    Admin.pluck(:name).include? session[:cas_user]
  end

  def current_user
    session[:cas_user]
  end

  def fetch_prev_request
      @prev_req = CabRequest.find_all_by_requester(@req.requester_name, limit: 3)
  end

end
