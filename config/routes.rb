Rails.application.routes.draw do
  
  resources :reviews
  root to: "home#index"
  resources :posts
  devise_scope :user do
    devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  end
end
