Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "sessions", omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'auth/:provider/callback', to: 'session#create'
  get 'signout', to: 'session#destroy', as: 'signout'

  resources :pins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pins#index'
end
