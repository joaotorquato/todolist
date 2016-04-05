Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :lists, only: [:new, :create, :show, :index] do
    resources :tasks, only: [:create]
  end
end
