Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount StripeEvent::Engine, at: '/stripe-webhooks'


  resources :articles, only: [:index, :new, :create, :show]
  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  resources :tags, only: [:show]

  get :autocomplete, to: 'pages#autocomplete'

end
