Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
end
