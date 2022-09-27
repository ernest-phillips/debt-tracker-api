# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: %i[create index]
  resources :creditors, only: %i[index show create update destroy]
  resources :loans, only: %i[create index update destroy]
end
