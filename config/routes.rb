Rails.application.routes.draw do
  resources :projects
  resources :users
  root 'projects#index'
end
