FactoryBot.define do
  factory :quote do
    quote { Faker::TvShows::BreakingBad.character }
    author { Faker::Name.name }
    series { "Breaking Bad" }
  end
end
