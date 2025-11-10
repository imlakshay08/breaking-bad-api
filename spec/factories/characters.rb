FactoryBot.define do
  factory :character do
    name { Faker::Name.name }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
    occupation { [Faker::Job.title] }
    img { Faker::Internet.url }
    status { ['Alive', 'Deceased', 'Presumed dead', 'Unknown'].sample }
    nickname { Faker::Name.first_name }
    appearance { [1, 2, 3, 4, 5] }
    portrayed { Faker::Name.name }
    category { "Breaking Bad" }
  end
end
