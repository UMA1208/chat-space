Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resources :messages, only: [:index]
  resources :users, only: [:show, :edit]
  resources :groups, only: [:edit, :create]
end
