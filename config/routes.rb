Rails.application.routes.draw do

  root to: 'pages#home'
  devise_for :users
  get "about" => "pages#about"
  get "contact" => "pages#contact"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
