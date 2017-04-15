Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      post '/authenticate', to: 'authentication#authenticate'
      get '/validate_token', to: 'authentication#set_user_by_token'
      post '/users', to: 'users#create'
      get '/users/confirm_email', to: 'users#confirm_email'
      post 'auth/:provider', to: 'auth#authenticate'
      get 'projects/draft', to: 'projects#get_draft_project'
      resources :projects, only: [:create, :index, :update, :destroy, :show]
      resources :category, only: :index
    end
  end

end
