
Idea.destroy_all
User.destroy_all
Cohort.destroy_all

cohort = Cohort.create!(cohort: '1909')
n = 1
5.times do
  user = User.create!(github_id: "1234#{n}", token: "ABCD#{n}", handle: "JoshRocks#{n}", cohort_id: cohort.id)
  Idea.create!(title: "Great Idea#{n}", pitch: 'save the world', problem: "overpopulation", solution: 'none', audience: 'students', features: 'dope stuff', apis: 'sure', oauth: 'github', user_id: user.id, cohort_id: cohort.id)
  n += 1
end
