Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :lists, only: [:new, :create, :show, :index] do
    resources :tasks, only: [:create]
    get 'public', on: :collection
    get 'mark_favorite', on: :member
    get 'favorite', on: :collection
  end
end
