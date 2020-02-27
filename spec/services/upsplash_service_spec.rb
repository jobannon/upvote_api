require 'rails_helper'

describe "UpsplashService can hit upslash API" do
  it 'if given a keyword of dog, can show a url related to a dog', :vcr do
    photo_url = IdeasPhotoGetter.new("dog").get_photo

    expected_url = "https://images.unsplash.com/photo-1534361960057-19889db9621e?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjExNzMzMX0"
    expect(photo_url).to eq(expected_url)
  end
end
