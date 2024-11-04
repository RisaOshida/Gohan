Rails.application.routes.draw do
  root to: "recipes#index"
  get :about, to: "homes#about"

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
  }
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
    get "users/unsubscribe", to: "users/registrations#unsubscribe"
  end

  devise_for :admins, skip: %i(registrations), controllers: {
    sessions: "admin/sessions",
  }

  namespace :admin do
    resources :recipes, only: %i(index show edit update destroy)
    resources :categories, only: %i(index create edit update destroy)
    resources :users, only: %i(index show edit update destroy)
    resources :comments, only: %i(index destroy)
    get 'dashboards', to: 'dashboards#index'
  end

  resources :recipes, only: %i(show new create edit update destroy) do
    resources :comments, only: %i(create destroy)
    resource :goods, only: %i(create destroy)
  end

  resources :users, only: %i(index show)
end
