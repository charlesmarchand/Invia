Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'dashboard', to: 'pages#dashboard', as: :dashboard
  post 'details/:id', to: 'studies#details', as: :details
  resources :keywords, only: [:index]

  resources :jobs, only: [:index] do
    resources :profile_saved_infos, only: [:create, :destroy]
    resources :professionals, only: [:index]
    resources :studies, only: [:index, :show] do
      resources :profile_saved_infos, only: [:create, :destroy]
    end
  end
end

