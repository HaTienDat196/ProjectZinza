FactoryGirl.define do
  factory :product do
    name          { Faker::Name.name }
    price         { Faker::Number.number(3) }
    number        { Faker::Number.number(4) }
    category_id   1
  end
end
