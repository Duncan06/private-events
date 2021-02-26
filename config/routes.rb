Rails.application.routes.draw do
  resources :users

  resources :events, only: [:index, :show, :new, :create] do

    member do

      get 'attend'

    end

  end

  resources :invitations, only: [:create, :update, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'sessions#welcome'

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  get 'welcome', to: 'sessions#welcome'

  delete 'logout', to: 'sessions#destroy'
  
end
