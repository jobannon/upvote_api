FactoryBot.define do
  factory :idea do
    title { Faker::App.name }
    pitch { Faker::HitchhikersGuideToTheGalaxy.marvin_quote }
    problem { Faker::Hipster.paragraph }
    solution { Faker::Marketing.buzzwords }
    audience { Faker::Demographic.educational_attainment }
    features { Faker::Space.nebula }
    apis { Faker::GreekPhilosophers.name }
    oauth { Faker::BossaNova.song }
    cohort
    user
  end
end
