Rails.application.routes.draw do
  root to: 'pages#home'


  resources :legislations, only: [:show] do
    resources :sections, only: [:show]
    resources :consultations, only: [:new, :create, :destroy]
  end

  resources :consultations, only: [:show] do
    resources :general_feedback, only: [:show, :new, :create]
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

end
