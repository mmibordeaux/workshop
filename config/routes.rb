Rails.application.routes.draw do
  devise_for :users

  resources :projects
  resources :users
  resources :features

  root 'projects#index'
end
