Rails.application.routes.draw do
  root to: 'pages#home'

  resources :consultations, only: [:show, :new, :create, :destroy] do
    resources :legislations, only: [:show] do
      resources :sections, only: [:show]
    end
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
