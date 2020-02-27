class Api::V1::IdeasController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    cohort = Cohort.find(current_user.cohort_id)
    render json: IdeaSerializer.new(cohort.ideas.sort_by { |idea| idea.vote_count }.reverse)
  end

  def show
    render json: IdeaSerializer.new(Idea.find(params[:id]))
  end

  def create
    photo_url = IdeasPhotoGetter.new(params[:title]).get_photo
    Idea.create!(title: params[:title], pitch: params[:pitch], problem: params[:problem], solution: params[:solution], features: params[:features], audience: params[:audience], apis: params[:apis], oauth: params[:oauth], cohort_id: current_user.cohort_id, user_id: current_user.id, img_url: photo_url)
    redirect_to "#{ENV['FRONTEND']}/cohorts/ideas"
  end

  def update
    idea = Idea.find(params[:id])
    idea.update!(title: params[:title], pitch: params[:pitch], problem: params[:problem], solution: params[:solution], features: params[:features], audience: params[:audience], apis: params[:apis], oauth: params[:oauth], cohort_id: current_user.cohort_id, user_id: current_user.id)
    redirect_to "#{ENV['FRONTEND']}/cohorts/ideas"
  end

  def destroy
    Idea.find(params[:id]).destroy
    redirect_to "#{ENV['FRONTEND']}/cohorts/ideas"
  end

  def statistics
    current_user
  end
end
