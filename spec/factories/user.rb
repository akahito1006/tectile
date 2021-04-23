FactoryBot.define do
  factory :user do
    name   { "testuser1" }
    email  { "testuser1@test.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
