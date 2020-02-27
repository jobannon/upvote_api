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
  title: 'Bucket',
  pitch: Faker::Quotes::Shakespeare.hamlet_quote,
  problem: Faker::TvShows::MichaelScott.quote,
  solution: Faker::Food.description,
  audience: Faker::Relationship.familial,
  features: Faker::Space.nebula,
  apis: Faker::GreekPhilosophers.name,
  oauth: Faker::BossaNova.song,
  img_url: 'https://bit.ly/3ccnRXz',
  cohort_id: cohort.id,
  user_id: user_1.id
)

idea_2 = Idea.create!(
  title: 'Nebulous',
  pitch: Faker::Quotes::Shakespeare.hamlet_quote,
  problem: Faker::TvShows::MichaelScott.quote,
  solution: Faker::Food.description,
  audience: Faker::Relationship.familial,
  features: Faker::Space.nebula,
  apis: Faker::GreekPhilosophers.name,
  oauth: Faker::BossaNova.song,
  img_url: 'https://bit.ly/39cdam8',
  cohort_id: cohort.id,
  user_id: user_2.id
)

idea_3 = Idea.create!(
  title: 'skye',
  pitch: Faker::Quotes::Shakespeare.hamlet_quote,
  problem: Faker::TvShows::MichaelScott.quote,
  solution: Faker::Food.description,
  audience: Faker::Relationship.familial,
  features: Faker::Space.nebula,
  apis: Faker::GreekPhilosophers.name,
  oauth: Faker::BossaNova.song,
  img_url: 'https://bit.ly/2PxdSCm',
  cohort_id: cohort.id,
  user_id: user_2.id
)

idea_4 = Idea.create!(
  title: 'Spittelau',
  pitch: Faker::Quotes::Shakespeare.hamlet_quote,
  problem: Faker::TvShows::MichaelScott.quote,
  solution: Faker::Food.description,
  audience: Faker::Relationship.familial,
  features: Faker::Space.nebula,
  apis: Faker::GreekPhilosophers.name,
  oauth: Faker::BossaNova.song,
  img_url: 'https://bit.ly/32DHJ1p',
  cohort_id: cohort.id,
  user_id: user_3.id
)

idea_5 = Idea.create!(
  title: 'pasture',
  pitch: Faker::Quotes::Shakespeare.hamlet_quote,
  problem: Faker::TvShows::MichaelScott.quote,
  solution: Faker::Food.description,
  audience: Faker::Relationship.familial,
  features: Faker::Space.nebula,
  apis: Faker::GreekPhilosophers.name,
  oauth: Faker::BossaNova.song,
  img_url: 'https://bit.ly/2T5F2mg',
  cohort_id: cohort.id,
  user_id: user_3.id
)

idea_6 = Idea.create!(
  title: 'flight',
  pitch: Faker::Quotes::Shakespeare.hamlet_quote,
  problem: Faker::TvShows::MichaelScott.quote,
  solution: Faker::Food.description,
  audience: Faker::Relationship.familial,
  features: Faker::Space.nebula,
  apis: Faker::GreekPhilosophers.name,
  oauth: Faker::BossaNova.song,
  img_url: 'https://bit.ly/397yF7h',
  cohort_id: cohort.id,
  user_id: user_3.id
)
