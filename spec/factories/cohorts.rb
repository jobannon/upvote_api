FactoryBot.define do
  factory :cohort do
    cohort_number { Faker::Number.number(digits: 4) }
  end
end
