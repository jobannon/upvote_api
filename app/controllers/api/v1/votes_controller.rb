class Api::V1::VotesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    idea = Idea.find(params[:id])
    if Vote.vote_limit(current_user, idea.id)
      Vote.create!(user_id: current_user.id, idea_id: idea.id, cohort_id: current_user.cohort_id)
      idea.vote_count += 1
      idea.save
    end
  end

  def show
    stats = Statistics.new(current_user)
    render json: {data: stats.statistics}
  end
end
