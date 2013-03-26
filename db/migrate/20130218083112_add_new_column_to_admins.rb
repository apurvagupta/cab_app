# -*- encoding : utf-8 -*-
class AddNewColumnToAdmins < ActiveRecord::Migration
  def up
    add_column :admins, :status, :boolean
  end

  def down
    remove_column :admins, :status
  end
end
