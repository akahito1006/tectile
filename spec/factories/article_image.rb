FactoryBot.define do
  factory :article_image do
    article_id { 1 }
    image_id   { Faker::Lorem.characters(number: 20) }
  end
end
