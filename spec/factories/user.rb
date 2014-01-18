FactoryGirl.define do
  factory :user do
    email { "#{generate(:random_string)}@example.com" }
    password { generate(:random_string) }
    password_confirmation { password }
  end
end
