class Api::V1::VotesController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
    idea = Idea.find(params[:id])
    idea.vote_count += 1
    idea.save
    redirect_to 'http://localhost:9292/cohorts/ideas'
  end
end
