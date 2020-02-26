require 'rails_helper'

describe "ideas API" do
  xit "send a list of ideas for each cohort" do
    cohort = create(:cohort)
    user = create(:user, cohort_id: cohort.id)

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

  it "create idea " do 
    cohort = create(:cohort)
    user = create(:user, cohort_id: cohort.id)
    idea = create(:idea, cohort_id: cohort.id, user_id: user.id)
    default_img = "https://images.unsplash.com/photo-1552862750-746b8f6f7f25?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"

    expect(Idea.first.img_url).to eq(default_img)    
    #
    #b/c we cannot do a controller test

    photo_url = IdeasPhotoGetter.new("dog").get_photo
    Idea.create!(title: "dog", pitch: 'save the world', problem: "overpopulation", solution: 'none', audience: 'students', features: 'dope stuff', apis: 'sure', oauth: 'github', user_id: user.id, cohort_id: cohort.id, img_url: photo_url)

    expected_url = "https://images.unsplash.com/photo-1534361960057-19889db9621e?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjExNzMzMX0"
    idea = Idea.last

    expect(idea.img_url).to eq(expected_url)
  end
end
