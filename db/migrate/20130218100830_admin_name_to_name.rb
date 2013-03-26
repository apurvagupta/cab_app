# -*- encoding : utf-8 -*-
class AdminNameToName < ActiveRecord::Migration
   def change
   	rename_column(:admins,:admin_name,:name)
   end
end
