Rails.application.routes.draw do
	root 'homes#index'

  devise_for :users

  get 'home/about' => 'homes#show'
  resources :homes, only: [:index]
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
