Rails.application.routes.draw do
  
  resources :messages
  root to: "home#index"
  # get '/posts/:id/room', to: 'posts#room'
  resources :posts do
    resources :reviews
  end
  devise_scope :user do
    devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  end
  resources :users, :only => [:show]
end
