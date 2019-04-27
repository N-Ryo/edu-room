Rails.application.routes.draw do
  
  root to: "home#index"
  resources :posts do
    resources :reviews
  end
  devise_scope :user do
    devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  end
  resources :users, :only => [:show]
end
