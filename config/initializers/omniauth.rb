Dotenv.load

Rails.application.config.middleware.use OmniAuth::Builder do
    # provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], :skip_jwt => true
    # provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], :skip_jwt => true
    provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_SECRET'], :skip_jwt => true
  end