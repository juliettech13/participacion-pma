Rails.application.routes.draw do
  resources :legislations do
    resources :sections do
      resources :clauses
    end
  end


  resources :questions
  resources :consultations
  resources :answers
  resources :consultations


  devise_for :users
    # controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
