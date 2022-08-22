Rails.application.routes.draw do
  resources :blogs
  get 'sessions/new'
  root 'users#new'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
end
