Rails.application.routes.draw do
  devise_for :users
  
  root to: 'static#index'
  get 'pages', to: 'static#pages'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
