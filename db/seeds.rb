Idea.destroy_all
User.destroy_all
Cohort.destroy_all

cohort = Cohort.create!( cohort_number: '1909' )

user_1 = User.create!(
  github_id: Faker::Number.number(digits: 8),
  token: Faker::Number.number(digits: 10),
  handle: Faker::Artist.name,
  cohort_id: cohort.id
)

user_2 = User.create!(
  github_id: Faker::Number.number(digits: 8),
  token: Faker::Number.number(digits: 10),
  handle: Faker::Artist.name,
  cohort_id: cohort.id
)

user_3 = User.create!(
  github_id: Faker::Number.number(digits: 8),
  token: Faker::Number.number(digits: 10),
  handle: Faker::Artist.name,
  cohort_id: cohort.id
)

idea_1 = Idea.create!(
  title: Faker::App.name,
  pitch: Faker::Quotes::Shakespeare.hamlet_quote,
  problem: Faker::TvShows::MichaelScott.quote,
  solution: Faker::Food.description,
  audience: Faker::Relationship.familial,
  features: Faker::Space.nebula,
  apis: Faker::GreekPhilosophers.name,
  oauth: Faker::BossaNova.song,
  img_url: 'https://source.unsplash.com/random',
  cohort_id: cohort.id,
  user_id: user_1.id
)

idea_2 = Idea.create!(
  title: Faker::App.name,
  pitch: Faker::Quotes::Shakespeare.hamlet_quote,
  problem: Faker::TvShows::MichaelScott.quote,
  solution: Faker::Food.description,
  audience: Faker::Relationship.familial,
  features: Faker::Space.nebula,
  apis: Faker::GreekPhilosophers.name,
  oauth: Faker::BossaNova.song,
  img_url: 'https://source.unsplash.com/random',
  cohort_id: cohort.id,
  user_id: user_2.id
)

idea_3 = Idea.create!(
  title: Faker::App.name,
  pitch: Faker::Quotes::Shakespeare.hamlet_quote,
  problem: Faker::TvShows::MichaelScott.quote,
  solution: Faker::Food.description,
  audience: Faker::Relationship.familial,
  features: Faker::Space.nebula,
  apis: Faker::GreekPhilosophers.name,
  oauth: Faker::BossaNova.song,
  img_url: 'https://source.unsplash.com/random',
  cohort_id: cohort.id,
  user_id: user_2.id
)

idea_4 = Idea.create!(
  title: Faker::App.name,
  pitch: Faker::Quotes::Shakespeare.hamlet_quote,
  problem: Faker::TvShows::MichaelScott.quote,
  solution: Faker::Food.description,
  audience: Faker::Relationship.familial,
  features: Faker::Space.nebula,
  apis: Faker::GreekPhilosophers.name,
  oauth: Faker::BossaNova.song,
  img_url: 'https://source.unsplash.com/random',
  cohort_id: cohort.id,
  user_id: user_3.id
)

idea_5 = Idea.create!(
  title: Faker::App.name,
  pitch: Faker::Quotes::Shakespeare.hamlet_quote,
  problem: Faker::TvShows::MichaelScott.quote,
  solution: Faker::Food.description,
  audience: Faker::Relationship.familial,
  features: Faker::Space.nebula,
  apis: Faker::GreekPhilosophers.name,
  oauth: Faker::BossaNova.song,
  img_url: 'https://source.unsplash.com/random',
  cohort_id: cohort.id,
  user_id: user_3.id
)

idea_6 = Idea.create!(
  title: Faker::App.name,
  pitch: Faker::Quotes::Shakespeare.hamlet_quote,
  problem: Faker::TvShows::MichaelScott.quote,
  solution: Faker::Food.description,
  audience: Faker::Relationship.familial,
  features: Faker::Space.nebula,
  apis: Faker::GreekPhilosophers.name,
  oauth: Faker::BossaNova.song,
  img_url: 'https://source.unsplash.com/random',
  cohort_id: cohort.id,
  user_id: user_3.id
)
