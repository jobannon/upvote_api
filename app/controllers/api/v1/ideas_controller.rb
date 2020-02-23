class Api::V1::IdeasController < ApplicationController

  def index
    # cohort = Cohort.find(params[:cohort_id])
    cohort = Cohort.find_by(cohort_number: params[:cohort_id])
    render json: IdeaSerializer.new(cohort.ideas)
  end

  def show
    render json: IdeaSerializer.new(Idea.find(params[:id]))
  end

  def create
    nineteenohnine = Cohort.create!(cohort_number: '1909')
    user = User.create!(cohort_id: nineteenohnine.id, github_id: '1', token: '1', handle: 'a')

    Idea.create!(title: params[:title], pitch: params[:pitch], problem: params[:problem], solution: params[:solution], features: params[:features], audience: params[:audience], apis: params[:apis], oauth: params[:OAuth], cohort_id: nineteenohnine.id, user_id: user.id)
    # Idea.create!(idea_params, user: user.id, cohort_id: nineteenohnine.id)
  end

  private

  def idea_params
    params.permit(
      :title,
      :pitch,
      :problem,
      :solution,
      :audience,
      :features,
      :apis,
      :oauth,
      :OAuth,
      :cohort_id
    )
  end
end
