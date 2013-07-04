class AddStatusToCabRequest < ActiveRecord::Migration
  def up
    add_column :cab_requests, :status, :string, :default => "Pending"
  end

  def down
    remove_column :cab_requests, :status
  end
end
