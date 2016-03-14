Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    collection do
      get 'synthesis'
    end
  end
  get 'users/me' => 'users#me', as: 'my_profile'
  patch 'users/me' => 'users#update_me', as: 'update_my_profile'
  resources :users
  resources :features do
    collection do
      get 'synthesis'
    end
  end
  resources :fields
  root 'features#index'
end
