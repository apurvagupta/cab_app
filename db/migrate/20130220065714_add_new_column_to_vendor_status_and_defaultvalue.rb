class AddNewColumnToVendorStatusAndDefaultvalue < ActiveRecord::Migration
  def up
    change_column :admins, :status, :boolean, :default => false
    add_column :vendors, :status, :boolean, :default => false
  end

  def down
    change_column :admins, :status, :boolean, :default => nil
    delete_column :vendors, :status
  end
end
