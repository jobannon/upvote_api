FactoryBot.define do
  factory :user do
    github_id { Faker::Number.number(digits: 8) }
    handle { Faker::Artist.name }
    cohort
  end
end
