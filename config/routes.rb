Rails.application.routes.draw do
  resources :posts
  root to: "posts#index"

  get 'signup', to: 'users#new'
  resources :users, except: [:new]
end
