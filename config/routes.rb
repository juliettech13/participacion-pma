Rails.application.routes.draw do
  root to: 'pages#home'


  resources :legislations, only: [:show] do
    resources :consultations, only: [:show, :new, :create, :destroy]
    resources :sections, only: [:show]
  end

  resources :clauses, only: [:show] do
    resources :questions, only: [:show]
  end


  get "/pages/finished", to: 'pages#finished'

  resources :answers


  devise_for :users
    # controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # mount Facebook::Messenger::Server, at: 'bot'

end
