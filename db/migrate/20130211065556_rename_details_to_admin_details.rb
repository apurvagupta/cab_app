# -*- encoding : utf-8 -*-
class RenameDetailsToAdminDetails < ActiveRecord::Migration
  def change
    rename_table :details , :admin_details
  end
end
