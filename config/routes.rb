Rails.application.routes.draw do
  # devise_for :users
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'

  resources :tasks
  resources :users, only: %i[index show]
  resources :sessions, only: %i[create destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
