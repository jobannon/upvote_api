class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    auth_hash = request.env['omniauth.auth']
    user = User.create_user(auth_hash)
    session[:user_id] = user.id
    redirect_to "#{ENV['FRONTEND']}/cohorts/ideas"
  end

  def user
    if current_user
      data = {data: {id: current_user.id, handle: current_user.handle, ideas: current_user.ideas}}
    else
      data = {data: {message: "Not Logged In"}}
    end
    render json: data
  end
end
