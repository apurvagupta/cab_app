# -*- encoding : utf-8 -*-
class AlteringColumnNoOfPassengersInCabRequests < ActiveRecord::Migration
  def up
    change_column(:cab_requests, :no_of_passengers, :integer)
  end

  def down
    change_column(:cab_requests, :no_of_passengers, :string)
  end
end
