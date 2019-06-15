FactoryBot.define do
  factory :product do
    name { "MyString" }
    description { "MyString" }
    price { "9.99" }
    stock { "9.99" }
    category { nil }
  end
end
