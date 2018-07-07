Rails.application.routes.draw do
  get "sessions/login", to: "sessions#login", as: :login
  get "sessions/register", to: "sessions#register", as: :register
  get "sessions/receive-login", to: "sessions#receive_login", as: :receive_login
  post "sessions/save-login", to: "sessions#save_login", as: :save_login
  delete "sessions/logout", to: "sessions#logout", as: :logout
  resources :exercises
  resources :exercise_sets, path: "sets"
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "exercise_sets#index"
end
