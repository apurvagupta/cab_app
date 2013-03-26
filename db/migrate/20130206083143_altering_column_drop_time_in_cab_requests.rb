# -*- encoding : utf-8 -*-
class AlteringColumnDropTimeInCabRequests < ActiveRecord::Migration
  def up
    rename_column(:cab_requests,:drop_time,:time)
  end

  def down
    rename_column(:cab_requests,:time,:drop_time)
  end
end
