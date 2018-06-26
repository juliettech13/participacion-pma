Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'pages#home'

  resources :legislations, only: [:show] do
    resources :sections, only: [:show]
    resources :consultations, only: [:new, :create, :destroy]
  end

  resources :consultations, only: [:show] do
    resources :general_feedbacks, only: [:show, :new, :create]
  end

  resources :clauses, only: [:show] do
    resources :questions, only: [:show]
  end


  get "/pages/finished", to: 'pages#finished'

  resources :answers



  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }


    # controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # mount Facebook::Messenger::Server, at: 'bot'


  get 'dashboard', to: 'pages#dashboard'


end
