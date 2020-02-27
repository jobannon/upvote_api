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

  it 'can show an idea' do
    cohort = create(:cohort)
    user = create(:user, cohort_id: cohort.id)
    idea = create(:idea, cohort_id: cohort.id, user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    get "/api/v1/cohorts/ideas/#{idea.id}"

    parsed_json = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_json[:data][:attributes][:title]).to eq(idea.title)
    expect(parsed_json[:data][:attributes][:pitch]).to eq(idea.pitch)
    expect(parsed_json[:data][:attributes][:problem]).to eq(idea.problem)
    expect(parsed_json[:data][:attributes][:solution]).to eq(idea.solution)
    expect(parsed_json[:data][:attributes][:audience]).to eq(idea.audience)
    expect(parsed_json[:data][:attributes][:features]).to eq(idea.features)
    expect(parsed_json[:data][:attributes][:apis]).to eq(idea.apis)
    expect(parsed_json[:data][:attributes][:oauth]).to eq(idea.oauth)
  end

  it 'can update an idea' do
    cohort = create(:cohort)
    user = create(:user, cohort_id: cohort.id)
    idea = Idea.create(
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
    )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    expected_params = {
      title: "cat",
      pitch: 'save the world',
      problem: "overpopulation",
      solution: 'none',
      audience: 'students',
      features: 'dope stuff',
      apis: 'sure',
      oauth: 'github',
      user_id: user.id,
      cohort_id: cohort.id
    }

    post "/api/v1/cohorts/ideas/#{idea.id}/edit", params: expected_params
    get "/api/v1/cohorts/ideas/#{idea.id}"

    parsed_json = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_json[:data][:attributes][:title]).to eq(expected_params[:title])
    expect(parsed_json[:data][:attributes][:title]).to_not eq(idea.title)
    expect(parsed_json[:data][:attributes][:pitch]).to eq(idea.pitch)
    expect(parsed_json[:data][:attributes][:problem]).to eq(idea.problem)
    expect(parsed_json[:data][:attributes][:solution]).to eq(idea.solution)
    expect(parsed_json[:data][:attributes][:audience]).to eq(idea.audience)
    expect(parsed_json[:data][:attributes][:features]).to eq(idea.features)
    expect(parsed_json[:data][:attributes][:apis]).to eq(idea.apis)
    expect(parsed_json[:data][:attributes][:oauth]).to eq(idea.oauth)
  end

  it 'can delete an idea' do
    cohort = create(:cohort)
    user = create(:user, cohort_id: cohort.id)
    idea_1 = create(:idea, cohort_id: cohort.id, user_id: user.id)
    idea_2 = Idea.create(
      title: "cat",
      pitch: 'save the world',
      problem: "overpopulation",
      solution: 'none',
      audience: 'students',
      features: 'dope stuff',
      apis: 'sure',
      oauth: 'github',
      user_id: user.id,
      cohort_id: cohort.id
    )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    post "/api/v1/cohorts/ideas/#{idea_2.id}/delete"
    get "/api/v1/cohorts/ideas"

    parsed_json = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_json[:data].count).to eq(1)
    expect(parsed_json[:data].first[:attributes][:title]).to eq(idea_1.title)
    expect(parsed_json[:data].first[:attributes][:title]).to_not eq(idea_2.title)
  end
end
