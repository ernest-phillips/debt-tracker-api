Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[create] do 
    resources: :loans
  end
  resources :creditors, only: %i[index show create update destroy]
end
