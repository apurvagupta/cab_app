class CreateVendors < ActiveRecord::Migration
  def up
  	create_table :vendors do |t|
    	t.string :vendor_name
    	t.string :vendor_contact_no
  	end	
  end

  def down
  	drop_table :vendors  	
  end
end
