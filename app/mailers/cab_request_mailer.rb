class CabRequestMailer < ActionMailer::Base
  ActionMailer::Base.delivery_method = :smtp
  default :from => "twcabrequest@gmail.com"

# send a signup email to the user, pass in the user object that contains the user's email address
  def send_email(cab_request,pick_up_date,pick_up_time,requester,admin_emails,vendor_email)
    mail(cc: [admin_emails,vendor_email,requester] , subject: "[Cab Request]", body:  "Name:\t" + cab_request.traveler_name+

                                                        "\nContact_no:\t" + cab_request.contact_no+

                                                        "\nFrom:\t" + cab_request.source+

                                                         "\nTo:\t" + cab_request.destination+

                                                         "\nOn:\t" + pick_up_date+

                                                         "\nAt:\t" + pick_up_time+

                                                         "\nNo of passengers:\t" + cab_request.no_of_passengers.to_s+

                                                         "\nComments:\t" + cab_request.comments+

                                                         "\nStatus:\t" + cab_request.status)

  end
end
