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

end
