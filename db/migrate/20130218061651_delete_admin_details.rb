# -*- encoding : utf-8 -*-
class DeleteAdminDetails < ActiveRecord::Migration
  def up
  	drop_table :admin_details
  end

  def down
  end
end
