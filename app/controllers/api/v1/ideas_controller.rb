class Api::V1::IdeasController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    user = current_user
    cohort = Cohort.find(user.cohort_id)
    render json: IdeaSerializer.new(cohort.ideas.sort_by { |idea| idea.vote_count }.reverse)
  end

  def show
    render json: IdeaSerializer.new(Idea.find(params[:id]))
  end

  def create
    photo_url = IdeasPhotoGetter.new(params[:title]).get_photo
    user = current_user
    Idea.create!(title: params[:title], pitch: params[:pitch], problem: params[:problem], solution: params[:solution], features: params[:features], audience: params[:audience], apis: params[:apis], oauth: params[:oauth], cohort_id: user.cohort_id, user_id: user.id, img_url: photo_url)

    redirect_to "#{ENV['FRONTEND']}/cohorts/ideas"
  end

  def statistics
    #current_user
  end
end
