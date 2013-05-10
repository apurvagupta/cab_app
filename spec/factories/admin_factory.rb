# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :admin, class: Admin do
    name 'ooga'
    contact_no '8765432100'
    email 'apurvagupta@gmail.com'
    status true
  end

  factory :inactive_valid_admin, parent: :admin do
    name 'pooga'
    status false
  end

  factory :invalid_admin, parent: :admin do
    name 'dooga'
    contact_no '9876543'
  end
end
