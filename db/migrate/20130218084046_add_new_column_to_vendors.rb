class AddNewColumnToVendors < ActiveRecord::Migration
  def up
  	add_column :vendors, :status, :boolean
  end

  def down
    remove_column :vendors, :status
  end
end
