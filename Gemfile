source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'
gem 'pg', '~> 0.20.0'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'annotate', '~> 2.7', '>= 2.7.1'
gem 'active_model_serializers', '~> 0.10.0'

group :development, :test do
  gem 'pry'
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'rack-cors', :require => 'rack/cors'
gem 'carrierwave', '~> 0.11.2'
gem 'cloudinary'
gem 'rails_admin'
gem 'dotenv-rails', groups: [:development, :test]
gem 'httparty'
gem 'jwt'
gem 'httpclient'
gem 'simple_command'
gem 'aasm', '~> 4.12.0'
