Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :mentors, only: [:show] do
        resource :calendar, module: :mentors, only: [:show] do
          member do
            # resources :months, module: mentors, only: [:show]
            # resources :weeks, module: mentors, only: [:show]
            resources :days, module: :calendars, only: [:show]
            resources :slots, module: :calendars, only: [:create, :destroy]
          end
        end
      end
    end
  end
end
