Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index', as: "splash"

  namespace :api do 
    namespace :v1 do 
      resources :cohorts, only: [:index] do 
        resources :ideas
      end
    end
  end
end
