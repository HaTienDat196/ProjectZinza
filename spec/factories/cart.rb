FactoryGirl.define do
  factory :cart do
    user_id 1
    quantity { Faker::Number.number(1) }
  end
end
