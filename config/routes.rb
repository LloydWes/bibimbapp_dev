Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :lessons
      resources :levels
      resources :results
      resources :vocabularies

      root to: "users#index"
    end
  devise_for :users
  authenticated :user do
    root to: 'static#courses', as: :authenticated_root
  end
  root to: 'static#index'
  # get 'pages', to: 'static#pages'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get '/courses', to: 'static#courses'
get '/vocabulary', to: 'static#vocabulary'
get '/profile', to: 'static#profile'
get '/level_choice', to: 'static#level_choice'
get '/cours', to: 'static#cours'

# route for engine forum
mount Thredded::Engine => '/forum'
end
