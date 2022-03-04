FactoryBot.define do
  factory :tag do
    title { Faker::Dessert.topping }
  end
end