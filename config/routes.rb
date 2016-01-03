Rails.application.routes.draw do
  resources :groups
  resources :users
  root 'groups#index'
end
