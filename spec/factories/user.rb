FactoryBot.define do
  factory :user do
    name   { "testuser1" }
    email  { "testuser1@test.com" }
    encrypted_password { Faker::Lorem.characters(number: 6) }
  end
end
