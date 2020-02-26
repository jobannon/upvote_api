Idea.destroy_all
User.destroy_all
Cohort.destroy_all

cohort = Cohort.create!(cohort_number: '1909')
n = 1
5.times do
  user = User.create!(github_id: "1234#{n}", token: "ABCD#{n}", handle: "JoshRocks#{n}", cohort_id: cohort.id)
  Idea.create!(title: "Great Idea#{n}", pitch: 'save the world', problem: "overpopulation", solution: 'none', audience: 'students', features: 'dope stuff', apis: 'sure', oauth: 'github', user_id: user.id, cohort_id: cohort.id)
  n += 1
end

# cohort = Cohort.create!( cohort_number: Faker::Number.number(digits: 4).to_s )
#
# user_1 = User.create!(
#   github_id: Faker::Number.number(digits: 8),
#   handle: Faker::Artist.name,
#   token: Faker::Number.number(digits: 10),
#   cohort_id: cohort.id
# )
#
# user_2 = User.create!(
#   github_id: Faker::Number.number(digits: 8),
#   handle: Faker::Artist.name,
#   token: Faker::Number.number(digits: 10),
#   cohort_id: cohort.id
# )
#
# user_3 = User.create!(
#   github_id: Faker::Number.number(digits: 8),
#   handle: Faker::Artist.name,
#   token: Faker::Number.number(digits: 10),
#   cohort_id: cohort.id
# )
#
# idea_1 = Idea.create!(
#   title: Faker::App.name,
#   pitch: Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote,
#   problem: Faker::Hipster.paragraph,
#   solution: Faker::Marketing.buzzwords,
#   audience: Faker::Demographic.educational_attainment,
#   features: Faker::Space.nebula,
#   apis: Faker::GreekPhilosophers.name,
#   oauth: Faker::BossaNova.song,
#   cohort_id: cohort.id,
#   user_id: user_1.id
# )
#
# idea_2 = Idea.create!(
#   title: Faker::App.name,
#   pitch: Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote,
#   problem: Faker::Hipster.paragraph,
#   solution: Faker::Marketing.buzzwords,
#   audience: Faker::Demographic.educational_attainment,
#   features: Faker::Space.nebula,
#   apis: Faker::GreekPhilosophers.name,
#   oauth: Faker::BossaNova.song,
#   cohort_id: cohort.id,
#   user_id: user_2.id
# )
#
# idea_3 = Idea.create!(
#   title: Faker::App.name,
#   pitch: Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote,
#   problem: Faker::Hipster.paragraph,
#   solution: Faker::Marketing.buzzwords,
#   audience: Faker::Demographic.educational_attainment,
#   features: Faker::Space.nebula,
#   apis: Faker::GreekPhilosophers.name,
#   oauth: Faker::BossaNova.song,
#   cohort_id: cohort.id,
#   user_id: user_2.id
# )
#
# idea_4 = Idea.create!(
#   title: Faker::App.name,
#   pitch: Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote,
#   problem: Faker::Hipster.paragraph,
#   solution: Faker::Marketing.buzzwords,
#   audience: Faker::Demographic.educational_attainment,
#   features: Faker::Space.nebula,
#   apis: Faker::GreekPhilosophers.name,
#   oauth: Faker::BossaNova.song,
#   cohort_id: cohort.id,
#   user_id: user_3.id
# )
#
# idea_5 = Idea.create!(
#   title: Faker::App.name,
#   pitch: Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote,
#   problem: Faker::Hipster.paragraph,
#   solution: Faker::Marketing.buzzwords,
#   audience: Faker::Demographic.educational_attainment,
#   features: Faker::Space.nebula,
#   apis: Faker::GreekPhilosophers.name,
#   oauth: Faker::BossaNova.song,
#   cohort_id: cohort.id,
#   user_id: user_3.id
# )
#
# idea_6 = Idea.create!(
#   title: Faker::App.name,
#   pitch: Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote,
#   problem: Faker::Hipster.paragraph,
#   solution: Faker::Marketing.buzzwords,
#   audience: Faker::Demographic.educational_attainment,
#   features: Faker::Space.nebula,
#   apis: Faker::GreekPhilosophers.name,
#   oauth: Faker::BossaNova.song,
#   cohort_id: cohort.id,
#   user_id: user_3.id
# )
