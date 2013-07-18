if Rails.env.production?

  # Those are test keys for stripe
  Stripe.api_key = "sk_test_p5uxXJdlOgwNFIe3Y26ujkOj"
  STRIPE_PUBLIC_KEY = "pk_test_4s6BqhUHVnTP0c4gMSehvNxr"

else 
  
  Stripe.api_key = "sk_test_p5uxXJdlOgwNFIe3Y26ujkOj"
  STRIPE_PUBLIC_KEY = "pk_test_4s6BqhUHVnTP0c4gMSehvNxr"

end
