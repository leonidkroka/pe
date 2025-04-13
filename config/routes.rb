require "sidekiq/web"

Rails.application.routes.draw do
  get "home/index"
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  get "up" => "rails/health#show", as: :rails_health_check

  mount Sidekiq::Web => "/sidekiq"

  root to: "home#index"
end
