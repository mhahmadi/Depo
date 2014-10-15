Rails.configuration.stripe = {
  publishable_key: 'pk_test_8XdyuAOAmvQpSXh0JZGJ1QUL',
  secret_key: 'sk_test_ljdqXFcRptWr5IOlpV69V1K9'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]