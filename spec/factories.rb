FactoryGirl.define do
  sequence(:email) { |n| "#{n}@carelibrary.org" }

  factory :category do
  end

  factory :provider do
  end

  factory :service do
  end

  factory :user do
    email { generate(:email) }
    admin false
    password "keyboardcat"
  end
end
