# -*- encoding : utf-8 -*-
class PickUpTimeDatatypeChangedTimeToDatetime < ActiveRecord::Migration
  def up
    remove_column :cab_requests, :pick_up_time
    add_column :cab_requests, :pick_up_time, :datetime
  end

  def down
    add_column :cab_requests, :pick_up_time, :time
    remove_column :cab_requests, :pick_up_time
  end
end
