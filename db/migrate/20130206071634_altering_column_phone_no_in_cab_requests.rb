class AlteringColumnPhoneNoInCabRequests < ActiveRecord::Migration
  def up
    change_column(:cab_requests,:phone_no,:string)
    rename_column(:cab_requests,:phone_no,:contact_no)

  end


  def down
    rename_column(:cab_requests,:contact_no,:phone_no)
  end
end
