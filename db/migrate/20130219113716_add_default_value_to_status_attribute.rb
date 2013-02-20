class AddDefaultValueToStatusAttribute < ActiveRecord::Migration
  def up
    change_column :admins, :status, :boolean, :default => false
    change_column :vendors, :status, :boolean, :default => false
  end

  def down
    change_column :admins, :status, :boolean, :default => nil
    change_column :vendors, :status, :boolean, :default => nil
  end
end
