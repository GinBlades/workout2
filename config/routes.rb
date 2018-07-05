Rails.application.routes.draw do
  resources :exercises
  resources :exercise_sets, path: "sets"
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "exercise_sets#index"
end
