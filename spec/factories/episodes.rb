FactoryBot.define do
  factory :episode do
    title { Faker::TvShows::BreakingBad.episode }
    season { rand(1..5) }
    episode { rand(1..13) }
    air_date { Faker::Date.between(from: '2008-01-20', to: '2013-09-29') }
    characters { [Faker::Name.name, Faker::Name.name] }
    series { "Breaking Bad" }
  end
end
