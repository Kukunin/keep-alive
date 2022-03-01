FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { '123123123' }
  end
end
