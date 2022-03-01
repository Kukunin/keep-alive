FactoryBot.define do
  factory :request do
    region { Region.regions.sample }
    city { Faker::Address.city }
    title { Faker::Hipster.sentence }
    reporter_ip { Faker::Internet.ip_v4_address }

    address { Faker::Address.street_address }
  end
end
