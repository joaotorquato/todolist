Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :lists, only: [:new, :create, :show] do
    resources :tasks, only: [:create]
  end
end
