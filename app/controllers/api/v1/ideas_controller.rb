class Api::V1::IdeasController < ApplicationController

  def index
    # cohort = Cohort.find(params[:cohort_id])
    cohort = Cohort.find_by(cohort_number: params[:cohort_id])
    render json: IdeaSerializer.new(cohort.ideas)
  end

  def show
    render json: IdeaSerializer.new(Idea.find(params[:id]))
  end

end

