class AddNewColumnEmailToAdminAndVendor < ActiveRecord::Migration
  def up
    add_column :admins, :email, :string
    add_column :vendors, :email, :string
    add_column :cab_requests, :email, :string
  end

  def down
    remove_column :admins, :email, :string
    remove_column :vendors, :email, :string
    remove_column :cab_requests, :email, :string
  end
end
