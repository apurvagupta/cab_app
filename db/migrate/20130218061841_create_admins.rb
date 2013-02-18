class CreateAdmins < ActiveRecord::Migration
  def up
  	create_table :admins do |t|
  		t.string :admin_name
  		t.string :admin_contact_no
    end
  end
  
  def down
  	drop_table :admins
  end
end
