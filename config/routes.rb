# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/clients/report_most_affected_clients', to: 'clients#report_most_affected_clients'

  resources :clients, only: [:index, :show, :create, :update, :destroy]
  resources :health_problems, only: [:index, :show, :create, :update, :destroy]
end
