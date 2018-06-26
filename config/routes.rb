Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'pages#home'


  resources :legislations, only: [:show] do
    resources :consultations, only: [:show, :new, :create, :destroy]
    resources :sections, only: [:show]
  end

  resources :clauses, only: [:show] do
    resources :questions, only: [:show] do
      resources :answers
    end
  end

  devise_for :users
    # controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # mount Facebook::Messenger::Server, at: 'bot'

  get 'dashboard', to: 'pages#dashboard'

end
