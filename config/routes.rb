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
  resources :users,  path: "/users", only: [:show]
  authenticated :user do
    root to: 'lessons#index', as: :authenticated_root
  end
  root to: 'static#index'

  resources :lessons

  get '/vocabulary', to: 'static#vocabulary'
  get '/profile', to: 'static#profile'
  get '/level_choice', to: 'static#level_choice'
  get '/contact', to:'static#contact'
  get '/cours', to: 'static#cours'

  # route for engine forum
  mount Thredded::Engine => '/forum'


  # resources :assessments
  # resources :assessment_questions do
  #   resources :assessment_options
  # end
  # resources :assessment_answers

  resource :user_assessment_attempt, only: [:new, :create, :show]
end
