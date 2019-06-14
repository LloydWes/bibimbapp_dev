Rails.application.routes.draw do

 root to: 'landing#index'
 resources :lessons, only: [:index, :show]
 resources :vocabularies, only: [:index]

 resources :lessons do
   resources :assessments, only: [:create, :index] do
     get 'take', to: 'assessments#new', on: :member, as: :new
     get 'attempt/:attempt', to: 'assessments#show', on: :member, as: :show
   end
 end

 devise_for :users
 resources :users,  path: "/users", only: [:show]
 authenticated :user do
   root to: 'lessons#index', as: :authenticated_root
 end

 # route for admin
 namespace :admin do
   resources :users
   resources :lessons
   resources :levels
   resources :vocabularies
   resources :assessments
   resources :assessment_questions
   resources :assessment_options
   resources :assessment_answers
   root to: "users#index"
 end

 # route for engine forum
 mount Thredded::Engine => '/forum'
end
