FactoryBot.define do
  factory :death do
    death { Faker::Name.name }
    cause { Faker::Lorem.sentence }
    responsible { Faker::Name.name }
    last_words { Faker::Lorem.sentence }
    season { rand(1..5) }
    episode { rand(1..13) }
    number_of_deaths { 1 }
  end
end
