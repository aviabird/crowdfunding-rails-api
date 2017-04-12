Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,      ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']
  provider :google_oauth2, ENV['GOOGLE_KEY'],   ENV['GOOGLE_SECRET']
end
