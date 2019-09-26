Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'pages#home'

  # root to: 'devise/registrations#new'

  get 'download_pdf', to: "legislations#download_pdf"

  resources :legislations, only: [:show] do
    # resources :sections, only: [:show]
    resources :consultations, only: [:new, :create, :destroy]
  end

  resources :consultations, only: [:show] do
    resources :general_feedbacks, only: [:show, :new, :create]
  end

  # resources :clauses, only: [:show] do
  #   resources :questions, only: [:show]
  # end

  # resources :metadatum, only: [:show]

  get "/pages/finished", to: 'pages#finished'

  resources :answers, only: [:new, :create]

  devise_for :users, controllers: { registrations: "registrations", omniauth_callbacks: 'users/omniauth_callbacks' }
end
