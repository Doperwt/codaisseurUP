Rails.application.routes.draw do

  root to: 'pages#home'
  devise_for :users
  resources :events,   except: [:destroy] do
      resources :bookings, only: [:new, :create,:index]
    end
  resources :categories
  resources :profiles
  resources :photos, only: [:destroy]
  get "about" => "pages#about"
  get "contact" => "pages#contact"
  # get "user" => "users#show"
  get "search" => "pages#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
