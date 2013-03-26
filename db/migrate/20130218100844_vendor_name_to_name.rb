# -*- encoding : utf-8 -*-
class VendorNameToName < ActiveRecord::Migration
  def change
    rename_column(:vendors, :vendor_name, :name)
  end
end
