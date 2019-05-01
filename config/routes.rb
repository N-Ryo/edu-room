Rails.application.routes.draw do
  
  root to: "home#index"
  get '/posts/:id/room', to: 'messages#index'
  # get '/posts/:id/room', to: 'posts#room'
  resources :posts do
    resources :reviews
    resources :messages, :only => [:create, :update, :destroy]
  end
  devise_scope :user do
    devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  end
  resources :users, :only => [:show]
end
