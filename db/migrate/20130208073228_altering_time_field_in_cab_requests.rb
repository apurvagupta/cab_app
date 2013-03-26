# -*- encoding : utf-8 -*-
class AlteringTimeFieldInCabRequests < ActiveRecord::Migration
  def up
      change_column(:cab_requests, :time, :string)
  end

  def down

  end
end
