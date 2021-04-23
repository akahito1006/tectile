FactoryBot.define do
  factory :admin do
    email { "admin@admin.com" }
    encrypted_password { Faker::Lorem.characters(number: 6) }
  end
end
