Rails.application.routes.draw do
  get 'users/show'
  get '/users', to: 'users#index'

  devise_for :users
  root 'books#index'
  
  resources :books
  resources :users, only: %i[index, show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
