FactoryBot.define do
  factory :location do
    name { Faker::Company.name }
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Address.zip_code }
  end
end
