Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :plugs, only: [ :index, :new, :create, :update ] do 
    resources :bookings, only: [ :new, :create ] 
  end

  resources :bookings, only: [:index, :show, :update] do
    resources :messages, only: [ :index, :create]
  end
end
