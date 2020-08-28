FactoryBot.define do
  factory :user do
    name { "Taro" }
    sequence :email do |n|
      "test#{n}@example.com"
    end
    password { "tarotaro" }
  end
end
