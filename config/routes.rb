Rails.application.routes.draw do
  get 'users/new'
  get 'loans/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: %i[create]
end
