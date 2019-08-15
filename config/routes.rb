Rails.application.routes.draw do
  get 'attendances/index'
	root to: 'events#index'
  devise_for :users
  get 'events/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :events
  resources :users, only: [:show, :edit, :update]
  resources :attendances, only: [:index, :new, :create, :destroy]
end
