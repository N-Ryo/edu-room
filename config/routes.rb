Rails.application.routes.draw do
  
  get 'users/show'
  resources :reviews
  root to: "home#index"
  resources :posts
  devise_scope :user do
    devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  end
  resources :users, :only => [:show]
end
