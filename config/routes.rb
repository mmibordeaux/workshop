Rails.application.routes.draw do
  devise_for :users
  resources :projects
  resources :users
  root 'projects#index'
end
