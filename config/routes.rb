Rails.application.routes.draw do
  # get 'planets/index'
  # get 'planets/show'
  # get 'planets/new'
  devise_for :users
  root to: "pages#home"
  # get "bookings", to: "bookings#index"
  # delete "/bookings/:id", to: "bookings#destroy", as: :booking
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :planets do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :destroy]
end
