class PickUpTimeDatatypeChangedTimeToDatetime < ActiveRecord::Migration
  def up
    change_column :cab_requests, :pick_up_time, :datetime
  end

  def down
    change_column :cab_requests, :pick_up_time, :time
  end
end
