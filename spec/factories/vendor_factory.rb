# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :vendor, class: Vendor do
    name 'bhidu'
    contact_no '9039499999'
    status true
  end

  factory :inactive_valid_vendor, parent: :vendor do
    status false
  end

  factory :invalid_vendor, parent: :vendor do
    contact_no '9876543'
  end
end
