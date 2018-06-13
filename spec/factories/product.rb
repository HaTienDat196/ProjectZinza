FactoryGirl.define do
  factory :product do
    name    { Faker::Name.name }
    number  { Faker::Number.number(5) }
    category_id   1
  end
end
