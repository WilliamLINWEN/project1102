Rails.application.routes.draw do
  get 'chatrooms/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'


  resources :chatrooms, only: :show
end
