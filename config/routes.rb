Rails.application.routes.draw do
  get 'doses/new'
  get 'cocktails/index'
  get 'cocktails/show'
  get 'cocktails/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :restaurants, except: [ :edit, :update, :destroy ] do
  #   resources :reviews, only: [ :new, :create ]
  # end

  resources :cocktails, except: [ :edit, :update, :destroy ] do
    resources :doses, only: [ :new, :create ]
  end

  resources :doses, only: [ :destroy ]

end
