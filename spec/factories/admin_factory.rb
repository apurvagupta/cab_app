FactoryGirl.define do
  factory :admin do
    factory :valid_admin_active do
      name 'ooga'
      contact_no '8765432100'
      status true
    end

    factory :valid_admin_inactive do
      name 'booga'
      contact_no '8765432100'
      status false
    end

    factory :invalid_admin do
      name 'cooga'
      contact_no '9876543'
      status false
    end
  end
end