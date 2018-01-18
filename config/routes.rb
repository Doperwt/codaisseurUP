Rails.application.routes.draw do

  root to: 'pages#home'
  devise_for :users
  resources :events,   except: [:destroy]
  resources :categories
  resources :profiles
  get "about" => "pages#about"
  get "contact" => "pages#contact"
  get "user" => "users#show"
  get "search" => "pages#index"
  delete "photo/destroy" => "photo#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
