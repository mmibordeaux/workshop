Rails.application.routes.draw do
  devise_for :users
  resources :projects
  get 'users/me' => 'users#me', as: 'my_profile'
  patch 'users/me' => 'users#update_me', as: 'update_my_profile'
  resources :users
  resources :features
  resources :fields
  root 'features#index'
end
