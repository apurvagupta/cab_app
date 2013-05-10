# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :vendor, class: Vendor do
    name 'bhidu'
    contact_no '9039499999'
    email "apurva@gmail.com"
    status true
  end

  factory :inactive_valid_vendor, parent: :vendor do
    name 'dhidu'
    status false
  end

  factory :invalid_vendor, parent: :vendor do
    name 'ghidu'
    contact_no '9876543'
  end
end
