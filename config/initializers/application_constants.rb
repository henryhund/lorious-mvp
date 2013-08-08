# CONSTANTS FROM ENVIRONMENT VARIABLES
GOOGLE_OAUTH2_CLIENT_ID     = ENV["GOOGLE_OAUTH2_CLIENT_ID"]
GOOGLE_OAUTH2_CLIENT_SECRET = ENV["GOOGLE_OAUTH2_CLIENT_SECRET"]
GOOGLE_OAUTH_PATH           = "/auth/google_oauth2"

Stripe.api_key              = ENV["STRIPE_SECRET_KEY"]
STRIPE_PUBLISHABLE_KEY      = ENV["STRIPE_PUBLISHABLE_KEY"]

AWS_BUCKET_NAME             = ENV["AWS_BUCKET_NAME"]
AWS_ACCESS_KEY_ID           = ENV["AWS_ACCESS_KEY_ID"]
AWS_SECRET_ACCESS_KEY       = ENV["AWS_SECRET_ACCESS_KEY"]

MAILCHIMP_API_KEY           = ENV["MAILCHIMP_API_KEY"]
MAILCHIMP_LIST_ID           = ENV["MAILCHIMP_LIST_ID"]

MANDRILL_USERNAME           = ENV["MANDRILL_USERNAME"]
MANDRILL_API_KEY            = ENV["MANDRILL_API_KEY"]
