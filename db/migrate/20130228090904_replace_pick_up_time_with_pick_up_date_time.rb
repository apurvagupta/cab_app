class ReplacePickUpTimeWithPickUpDateTime < ActiveRecord::Migration
  def up
    remove_column :cab_requests, :pick_up_date
    rename_column( :cab_requests, :pick_up_time, :pick_up_date_time)
  end

  def down
    add_column :cab_requests, :pick_up_date, :date
    rename_column( :cab_requests, :pick_up_date_time, :pick_up_time)
  end
end
