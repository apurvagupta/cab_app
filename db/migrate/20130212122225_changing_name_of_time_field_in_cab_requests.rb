# -*- encoding : utf-8 -*-
class ChangingNameOfTimeFieldInCabRequests < ActiveRecord::Migration
  def up
    rename_column(:cab_requests,:time,:pick_up_time)
  end

  def down
    rename_column(:cab_requests,:pick_up_time,:time)
  end
end
