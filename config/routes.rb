Rails.application.routes.draw do
  get '/', to: 'welcome#index', as: "splash"

  namespace :api do
    namespace :v1 do
      get '/cohorts', to: 'cohorts#index'
      get '/cohorts/ideas', to: 'ideas#index'
      get '/cohorts/ideas/:id', to: 'ideas#show'
      post '/cohorts/ideas/:id', to: 'ideas#create'
      patch '/cohorts/ideas/:id', to: 'ideas#update'
    end
  end

  get 'auth/github', as: 'github_login'
  get '/auth/github/callback', to: 'sessions#create'
end
