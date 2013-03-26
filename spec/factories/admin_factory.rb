# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :admin, class: Admin do
    name 'ooga'
    contact_no '8765432100'
    status true
  end

  factory :inactive_valid_admin, parent: :admin do
    status false
  end

  factory :invalid_admin, parent: :admin do
    contact_no '9876543'
  end
end
