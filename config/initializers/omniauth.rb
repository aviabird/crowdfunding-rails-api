Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,      ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']
  provider :google_oauth2, ENV['GOOGLE_KEY'],   ENV['GOOGLE_SECRET'], , {
    name: 'google',
    scope: 'email, profile, plus.me',
    prompt: 'select_account',
    image_aspect_ratio: 'square',
    image_size: 50,
    setup: (lambda do |env|
      request = Rack::Request.new(env)
      env['omniauth.strategy'].options['token_params'] = {
        redirect_uri: 'https://crowdpouch.herokuapp.com/auth/google_oauth2/callback'
      }
    end)
  }
end
