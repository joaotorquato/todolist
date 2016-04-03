Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :lists, only: [:new, :create, :show]
end
