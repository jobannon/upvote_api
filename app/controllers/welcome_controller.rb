class WelcomeController < ApplicationController

  def index
    #imagine the oauth
    session[:user_id] = User.first.id
    render json: User.first
  end
  
end
