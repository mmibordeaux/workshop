Rails.application.routes.draw do
  resources :fields
  devise_for :users

  resources :projects
  resources :users
  resources :features

  root 'projects#index'
end
