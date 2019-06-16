FactoryBot.define do
  factory :user do
    name { "Test User" }
    email { "test@store.com" }
    password { "abcd123" }
    phone_number { "529141782" }
    country_code { "971" }
    is_admin { true }
  end
end