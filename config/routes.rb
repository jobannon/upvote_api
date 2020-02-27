Rails.application.routes.draw do
  get '/', to: 'welcome#index', as: "splash"

  namespace :api do
    namespace :v1 do
      get '/cohorts', to: 'cohorts#index'
      get '/cohorts/ideas', to: 'ideas#index'

      post '/cohorts/ideas/new', to: 'ideas#create'
      post '/cohorts/ideas/:id/edit', to: 'ideas#update'
      post '/cohorts/ideas/:id/delete', to: 'ideas#destroy'
      post '/cohorts/ideas/:id', to: 'votes#create'

      get '/cohorts/ideas/:id', to: 'ideas#show'
    end
  end

  get 'auth/github', as: 'github_login'
  get '/auth/github/callback', to: 'sessions#create'
end
