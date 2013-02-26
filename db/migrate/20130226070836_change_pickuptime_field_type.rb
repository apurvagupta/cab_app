class ChangePickuptimeFieldType < ActiveRecord::Migration
  def up
  	change_column :cab_requests, :pick_up_time, :time
  	rename_column(:cab_requests,:date,:pick_up_date)
  	rename_column(:cab_requests,:traveler_name,:traveler_name)
  end

  def down
  	change_column :cab_requests, :pick_up_time, :string
  	rename_column(:cab_requests,:pick_up_date,:date)
  	rename_column(:cab_requests,:traveler_name,:traveler_name)
  end
end
