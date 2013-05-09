class CabRequestMailer < ActionMailer::Base
  default :from => "twcabrequest@gmail.com"

  # send a signup email to the user, pass in the user object that contains the user's email address
  def send_email(cab_request)

    mail(:to => "sharvishi9118@gmail.com",:subject => "Name: " + cab_request.traveler_name+

            ",Contact_no: " + cab_request.contact_no+

            ",From: " + cab_request.source+

            ",To: " + cab_request.destination+

            ",On: " + cab_request.pick_up_date_time.to_s+

            ",No of passengers: " + cab_request.no_of_passengers.to_s )

  end


end
