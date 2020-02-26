class Api::V1::IdeasController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    user = User.find(session[:user_id])
    cohort = Cohort.find(user.cohort_id)
    render json: IdeaSerializer.new(cohort.ideas.sort_by { |idea| idea.vote_count }.reverse)
  end

  def show
    render json: IdeaSerializer.new(Idea.find(params[:id]))
  end

  def create
    user = User.find(session[:user_id])
    Idea.create!(title: params[:title], pitch: params[:pitch], problem: params[:problem], solution: params[:solution], features: params[:features], audience: params[:audience], apis: params[:apis], oauth: params[:oauth], cohort_id: user.cohort_id, user_id: user.id)
    # Idea.create!(idea_params, user_id: user.id, cohort_id: user.cohort_id)
    redirect_to 'http://localhost:9292/cohorts/ideas'
  end

  private

  # def idea_params
  #   params.permit(
  #     :title,
  #     :pitch,
  #     :problem,
  #     :solution,
  #     :audience,
  #     :features,
  #     :apis,
  #     :oauth
  #   )
  # end
end
