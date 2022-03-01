FactoryBot.define do
  factory :comment do
    request
    username { Faker::Internet.name }
    message { Faker::Hipster.sentence }
    ip_address { Faker::Internet.ip_v4_address }
  end
end
