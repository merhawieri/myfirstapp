if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_iu5n7Okr1BDy8RyfvuvUHHln',
    secret_key: 'sk_test_IixKBSZcXrAglJN24h3ZZ89V'
  }
end
Stripe.api_key = Rails.configuration.stripe[:secret_key]
