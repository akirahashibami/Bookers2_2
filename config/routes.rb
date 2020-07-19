Rails.application.routes.draw do
	root 'books#index'

  devise_for :users

  resources :homes, only: [:index, :show]
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
