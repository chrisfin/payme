Rails.application.routes.draw do
  resources :users, :charges, :receivers

  root 	'static_pages#home'
  get   '/static_pages/stripe', to: 'static_pages#stripe'
  mount StripeEvent::Engine, at: 'webhooks/stripe'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
