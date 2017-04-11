Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,      '763807900464091', '3bcb1c63c79589fda9eeccf1b801e14e'
  provider :google_oauth2, '676583033944-57tm364opa3o3deln53gkg3g46r4j3gh.apps.googleusercontent.com', 'KqUCQ4WuBOhPK2i3c2FdlGyl'
end
