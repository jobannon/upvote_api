class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    auth_hash = request.env['omniauth.auth']
    found_user = User.where(github_id: auth_hash['uid'])
    if found_user.length > 0
      session[:user_id] = found_user[0].id
    else
      user = User.create_user(auth_hash)
      session[:user_id] = user.id
    end
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

  def destroy
    session.clear
    redirect_to "#{ENV['FRONTEND']}"
  end
end
