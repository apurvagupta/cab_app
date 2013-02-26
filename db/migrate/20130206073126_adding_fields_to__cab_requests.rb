class AddingFieldsToCabRequests < ActiveRecord::Migration
  def up
    add_column :cab_requests, :requester, :string
    add_column :cab_requests, :pick_up_for, :string
    add_column :cab_requests, :date, :date
    add_column :cab_requests, :source, :string
    add_column :cab_requests, :no_of_passengers, :string
  end

  def down
    remove_column :cab_requests, :requester
    remove_column :cab_requests, :pick_up_for
    remove_column :cab_requests, :date
    remove_column :cab_requests, :source
    remove_column :cab_requests, :no_of_passengers
  end

end