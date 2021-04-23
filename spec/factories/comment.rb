FactoryBot.define do
  factory :comment do
    user_id    { 1 }
    article_id { 1 }
    body       { Faker::Lorem.characters(number: 20) }
  end
end
