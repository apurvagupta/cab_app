# -*- encoding : utf-8 -*-
class AdminContactNoToContactNo < ActiveRecord::Migration
  def change
    rename_column(:admins, :admin_contact_no, :contact_no)
  end
end
