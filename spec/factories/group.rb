FactoryGirl.define do
  factory :group do
    name { generate(:random_string) }
  end
end
