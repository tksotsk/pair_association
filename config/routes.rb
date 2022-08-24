Rails.application.routes.draw do
  get 'favorites/show'
  resources :blogs
  get 'sessions/new'
  root 'users#new'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:index, :create, :destroy]
end
