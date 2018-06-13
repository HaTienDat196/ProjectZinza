FactoryGirl.define do
  factory :order do
    name          { Faker::Name.name }
    address         { Faker::Address.number(3) }
    email       { Faker::Internet.email }
  end
end
