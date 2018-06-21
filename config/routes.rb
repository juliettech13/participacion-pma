Rails.application.routes.draw do
  resources :legislations do
    resources :sections do
      resources :clauses
    end
  end


  resources :questions
  resources :consultations
  resources :answers


  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Facebook::Messenger::Server, at: 'bot'

end
