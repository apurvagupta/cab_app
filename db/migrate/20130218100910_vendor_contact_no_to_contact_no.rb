# -*- encoding : utf-8 -*-
class VendorContactNoToContactNo < ActiveRecord::Migration
  def change
    rename_column(:vendors, :vendor_contact_no, :contact_no)
  end
end
