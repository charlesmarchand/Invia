Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'dashboard', to: 'pages#dashboard', as: :dashboard
  post 'details/:id', to: 'studies#details', as: :details
  resources :keywords, only: [:index]

  resources :jobs, only: [:index] do
    resources :professionals, only: [:index]
    resources :studies, only: [:index, :show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
