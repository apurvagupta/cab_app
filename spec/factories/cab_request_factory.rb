FactoryGirl.define do
  factory :cab_request, class: CabRequest do |r|
    r.requester 'obama'
    r.contact_no '1234567890'
    r.destination 'hell'
    r.source 'heaven'
    r.pick_up_date '07/03/2913'
    r.pick_up_date_time  Time.now + 2.days
    r.traveler_name 'osama'
    r.no_of_passengers 1
    r.comments 'Help me pass test'
  end

end