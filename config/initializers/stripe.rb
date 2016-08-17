if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_0DDtJoRDk56qKmYN7hq5S6RO',
    #test publish key here
    :secret_key => 'sk_test_B9rU8OmJrp9wHIMwYi3k9wv4'
    #test secret key here
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]

#checks the enviroment.  If not in production, uses test keys.