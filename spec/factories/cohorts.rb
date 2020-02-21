FactoryBot.define do
  factory :cohort do
    cohort { Faker::Number.number(digits: 4) }
  end
end
