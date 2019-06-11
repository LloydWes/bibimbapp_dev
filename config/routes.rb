Rails.application.routes.draw do
  devise_for :users

  root to: 'static#index'
  get 'pages', to: 'static#pages'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/courses', to: 'static#courses'
  get '/vocabulary', to: 'static#vocabulary'
  get '/forum', to: 'static#forum'
  get '/profile', to: 'static#profile'
  get '/level_choice', to: 'static#level_choice'

  # route for engine forum
  mount Thredded::Engine => '/forum'


  # resources :assessments
  # resources :assessment_questions do
  #   resources :assessment_options
  # end
  # resources :assessment_answers
  
  resource :user_assessment_attempt, only: [:new, :create, :show]
end
