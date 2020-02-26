class ApplicationController < ActionController::Base
  before_action :set_headers

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private

  def set_headers
    headers['Access-Control-Allow-Origin'] = 'https://upvote-ideas-ui.herokuapp.com'
    headers['Access-Control-Allow-Credentials'] = true
    headers['Access-Control-Expose-Headers'] = 'ETag'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
    headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match'
    headers['Access-Control-Max-Age'] = '86400'
  end
end
