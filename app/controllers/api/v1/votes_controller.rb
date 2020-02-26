class Api::V1::VotesController < ApplicationController
  def create
    idea = Idea.find(params[:id])
    idea.vote_count += 1
    idea.save
    redirect_to 'https://upvote-ideas-ui.herokuapp.com/cohorts/ideas'
  end
end
