require 'rails_helper'

describe "ideas API" do
  it "send a list of ideas for each cohort" do
    cohort = create(:cohort)
    user = create(:user, cohort_id: cohort.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    create_list(:idea, 5, cohort_id: cohort.id, user_id: user.id)

    get '/api/v1/cohorts/ideas'

    expect(response).to be_successful

    ideas = JSON.parse(response.body)['data']
    expect(ideas.count).to eq(5)
  end

  it "idea show page" do
    cohort = create(:cohort)
    user = create(:user, cohort_id: cohort.id)
    idea = create(:idea, cohort_id: cohort.id, user_id: user.id)

    get "/api/v1/cohorts/ideas/#{idea.id}"

    expect(response).to be_successful

    idea = JSON.parse(response.body)['data']

    expect(idea['attributes'].keys).to include('title')
    expect(idea['attributes'].keys).to include('pitch')
    expect(idea['attributes'].keys).to include('problem')
    expect(idea['attributes'].keys).to include('solution')
    expect(idea['attributes'].keys).to include('audience')
    expect(idea['attributes'].keys).to include('features')
    expect(idea['attributes'].keys).to include('apis')
    expect(idea['attributes'].keys).to include('oauth')
    expect(idea['attributes'].keys).to include('user_id')
    expect(idea['attributes'].keys).to include('cohort_id')
    expect(idea['attributes'].keys).to include('updated_at')
    expect(idea['attributes'].keys).to_not include('created_at')
  end

  it "create idea" do
    cohort = create(:cohort)
    user = create(:user, cohort_id: cohort.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    post('/api/v1/cohorts/ideas/new', params: {
      title: "dog",
      pitch: 'save the world',
      problem: "overpopulation",
      solution: 'none',
      audience: 'students',
      features: 'dope stuff',
      apis: 'sure',
      oauth: 'github',
      user_id: user.id,
      cohort_id: cohort.id
    })

    expected_url = "https://images.unsplash.com/photo-1534361960057-19889db9621e?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjExNzMzMX0"
    idea = Idea.last

    expect(idea.img_url).to eq(expected_url)
  end
end
