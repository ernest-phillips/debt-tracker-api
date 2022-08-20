Rails.application.routes.draw do
  get 'creditors/index'
  get 'creditors/show'
  get 'creditors/create'
  get 'creditors/update'
  get 'creditors/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: %i[create]
end
