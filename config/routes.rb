Rails.application.routes.draw do
  devise_for :users
  root to: "events#index "

  resources :events, only: [:index, :show, :new, :create, :destroy] do
    resources :bookings, only: [:index, :create]
  end

  resources :bookings, only: [:index, :destroy]
end
