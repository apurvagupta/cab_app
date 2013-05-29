# -*- encoding : utf-8 -*-
class AlteringColumnNoOfPassengersInCabRequests < ActiveRecord::Migration
  def up
    remove_column(:cab_requests, :no_of_passengers)
    add_column(:cab_requests, :no_of_passengers, :integer)
    #change_column(:cab_requests, :no_of_passengers, :integer ,:USING )
    #ALTER TABLE cab_requests ALTER no_of_passengers TYPE integer USING no_of_passengers::int;
  end

  def down
    add_column(:cab_requests, :no_of_passengers, :integer)
    remove_column(:cab_requests, :no_of_passengers)
    #change_column(:cab_requests, :no_of_passengers, :string)
  end
end
