Rails.application.routes.draw do
   devise_for :users, controllers: { omniauth_callbacks:'users/omniauth_callbacks' }
   mount Commontator::Engine => '/commontator'

  resources :pins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pins#index'
end
