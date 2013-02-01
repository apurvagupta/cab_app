class CreateCabRequests < ActiveRecord::Migration
  def up
    create_table :cab_requests do |t|
      t.string :phone_no
      t.string :destination
      t.time :drop_time
      t.text :comments

      t.timestamps
    end
  end

  def down
    drop_table :cab_requests
  end
end
