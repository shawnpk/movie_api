FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    plot { Faker::Movie.quote }
    release_date { Faker::Date.between(from: 70.years.ago, to: Date.today) }
  end
end
