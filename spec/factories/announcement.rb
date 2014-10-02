FactoryGirl.define do
  factory :announcement do
    user
    restaurant_name Faker::Lorem.word
  end
end
