class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    auth_hash = request.env['omniauth.auth']
    user = User.create_user(auth_hash)
    session[:user_id] = user.id
    redirect_to "#{ENV['FRONTEND']}/cohorts/ideas"
  end
end
