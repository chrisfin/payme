Rails.application.routes.draw do
  get 'sessions/new'

  resources :users, :charges, :receivers

  root 	'static_pages#home'
  get   '/static_pages/stripe', to: 'static_pages#stripe'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  mount StripeEvent::Engine, at: 'webhooks/stripe'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
