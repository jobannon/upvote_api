require 'rails_helper'

describe "stats" do
  it "sends statistics" do
    cohort = create(:cohort)
    user = create(:user, cohort_id: cohort.id)
    create(:user, cohort_id: cohort.id)
    idea = create(:idea, cohort_id: cohort.id, user_id: user.id)
    create_list(:idea, 5, cohort_id: cohort.id, user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    Vote.create!(user_id: user.id, idea_id: idea.id, cohort_id: user.cohort_id)
    get '/api/v1/statistics'

    expect(response).to be_successful

    stats = JSON.parse(response.body)['data']
    expect(stats['stats']['user_count']).to eq(2)
    expect(stats['stats']['vote_count']).to eq(1)
    expect(stats['stats']['percent_complete']).to eq((1 / (6 * 3)))
  end


  it "three votes" do
    cohort = create(:cohort)
    user = create(:user, cohort_id: cohort.id)
    create(:user, cohort_id: cohort.id)
    idea = create(:idea, cohort_id: cohort.id, user_id: user.id)
    create_list(:idea, 5, cohort_id: cohort.id, user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    Vote.create!(user_id: user.id, idea_id: idea.id, cohort_id: user.cohort_id)
    Vote.create!(user_id: user.id, idea_id: idea.id, cohort_id: user.cohort_id)
    Vote.create!(user_id: user.id, idea_id: idea.id, cohort_id: user.cohort_id)
    get '/api/v1/statistics'

    expect(response).to be_successful

    stats = JSON.parse(response.body)['data']
    expect(stats['stats']['user_count']).to eq(2)
    expect(stats['stats']['vote_count']).to eq(3)
    expect(stats['stats']['percent_complete']).to eq((3 / (6 * 3)))
  end

  it "max votes" do
    cohort = create(:cohort)
    user = create(:user, cohort_id: cohort.id)
    create(:user, cohort_id: cohort.id)
    idea = create(:idea, cohort_id: cohort.id, user_id: user.id)
    create_list(:idea, 5, cohort_id: cohort.id, user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    Vote.create!(user_id: user.id, idea_id: idea.id, cohort_id: user.cohort_id)
    Vote.create!(user_id: user.id, idea_id: idea.id, cohort_id: user.cohort_id)
    result = Vote.vote_limit(user, idea.id)
    expect(result).to eq(true)

    Vote.create!(user_id: user.id, idea_id: idea.id, cohort_id: user.cohort_id)
    result = Vote.vote_limit(user, idea.id)
    expect(result).to eq(false)

    get '/api/v1/statistics'

    expect(response).to be_successful

    stats = JSON.parse(response.body)['data']
    expect(stats['stats']['user_count']).to eq(2)
    expect(stats['stats']['vote_count']).to eq(3)
    expect(stats['stats']['percent_complete']).to eq((3 / (6 * 3)))
  end
end
