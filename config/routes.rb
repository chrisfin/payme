Rails.application.routes.draw do
  resources :users, :charges, :receivers
  mount StripeEvent::Engine, at: 'webhooks/stripe'

  root 	'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
