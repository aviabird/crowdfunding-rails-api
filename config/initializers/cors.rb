# Rails.application.config.middleware.use Rack::Cors do
#   allow do
#     origins '*'
#     resource '*',
#     :headers => :any,
#     :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client'],
#     :methods => [:get, :post, :delete, :put, :patch, :options, :head]
#   end
# end