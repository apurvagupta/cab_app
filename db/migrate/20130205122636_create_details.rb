# -*- encoding : utf-8 -*-
class CreateDetails < ActiveRecord::Migration
  def up
    create_table :details do |t|
      t.string :support_phone_no
      t.string :vendor_phone_no
      t.string :assigned_admins
    end

  end

  def down
    drop_table :details
  end
end
