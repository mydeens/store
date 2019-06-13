FactoryBot.define do
  factory :user do
    name { "Test User" }
    email { "test@store.com" }
    password { "abcd123" }
  end
end