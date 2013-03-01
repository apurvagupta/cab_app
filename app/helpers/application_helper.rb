module ApplicationHelper

  def ist(time)
    time.in_time_zone(TZInfo::Timezone.get('Asia/Kolkata')).strftime("%I:%M %P")
  end


end
