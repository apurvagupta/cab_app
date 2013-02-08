class DropTableConfigureDetails < ActiveRecord::Migration
  def up
    drop_table :configure_details
  end

  def down
  end
end
