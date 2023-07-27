# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :health_problems, only: %i[index show create update destroy]
    end
  end

  namespace :api do
    namespace :v2 do
      resources :health_problems, only: %i[index show create update destroy]
    end
  end

  namespace :api do
    namespace :v1 do
      get '/clients/report_most_affected_clients', to: 'clients#report_most_affected_clients'
      resources :clients, only: %i[index show create update destroy]
    end
  end

  namespace :api do
    namespace :v2 do
      get '/clients/report_most_affected_clients', to: 'clients#report_most_affected_clients'
      resources :clients, only: %i[index show create update destroy]
    end
  end
end
