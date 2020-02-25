class Api::V1::IdeasController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    user = User.last
    #cohort = Cohort.find_by(cohort_number: params[:cohort_id])
    cohort = Cohort.find(user.cohort_id)
    render json: IdeaSerializer.new(cohort.ideas.sort_by { |idea| idea.vote_count }.reverse)
  end

  def show
    render json: IdeaSerializer.new(Idea.find(params[:id]))
  end

  def create
    idea = Idea.find(params[:id])
    idea.vote_count += 1
    idea.save
    redirect_to 'http://localhost:9292/cohorts/ideas'
  end

end
