require 'rails_helper'

describe "current user endpoint" do
  it "send a list of ideas for each cohort" do
    cohort = create(:cohort)
    user = create(:user, cohort_id: cohort.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    create_list(:idea, 2, cohort_id: cohort.id, user_id: user.id)

    get '/current_user'

    expect(response).to be_successful

    user_info = JSON.parse(response.body)['data']
    expect(user_info['id']).to eq(user.id)
    expect(user_info['handle']).to eq(user.handle)
    expect(user_info['ideas'].count).to eq(2)
  end
end
