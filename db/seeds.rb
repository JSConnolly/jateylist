require 'faker'

100.times do
  Category.create name: Faker::Name.name
end

1000.times do
  Post.create title: Faker::Lorem.sentence(rand(1..4)), price: (rand(1..100)+rand.round(2)), email: Faker::Internet.email,
  description: Faker::Lorem.paragraph(1), photo_url: Faker::Internet.url, 
  street_address: Faker::Address.street_address, city: Faker::Address.city,
  state: Faker::Address.state_abbr, zip: Faker::Address.zip_code, 
  category_id: rand(0..100), random_key: SecureRandom.hex(10)
end
