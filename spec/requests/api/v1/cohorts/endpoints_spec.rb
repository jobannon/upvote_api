require 'rails_helper'

describe "cohort API" do
  it "send a list of cohorts" do
    create_list(:cohort, 5)

    get '/api/v1/cohorts'

    expect(response).to be_successful

    cohorts = JSON.parse(response.body)['data']
    expect(cohorts.count).to eq(5)
  end
end
