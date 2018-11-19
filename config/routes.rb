Rails.application.routes.draw do
  # get 'doses/new'
  # get 'cocktails/index'
  # get 'cocktails/show'
  # get 'cocktails/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :restaurants, except: [ :edit, :update, :destroy ] do
  #   resources :reviews, only: [ :new, :create ]
  # end

  root to: 'cocktails#index'  # we make the cocktails index the root, such that http://localhost:3000 takes us to the cocktails index

  resources :cocktails, except: [:index, :edit, :update, :destroy ] do
    resources :doses, only: [ :new, :create ]
  end

  resources :doses, only: [ :destroy ]

end
