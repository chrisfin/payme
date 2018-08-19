Rails.configuration.stripe = {
  :publishable_key => Figaro.env.stripe_publishable_key,
  :secret_key      => Figaro.env.stripe_api_key
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

StripeEvent.signing_secrets = [
  Rails.application.secrets.stripe_account_signing_secret = Figaro.env.stripe_account_signing_secret
]

StripeEvent.configure do |events|
end