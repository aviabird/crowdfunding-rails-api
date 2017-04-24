Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      # routes for authentication controller for handling email login and tokens
      post '/authenticate', to: 'authentication#authenticate'
      get '/validate_token', to: 'authentication#set_user_by_token'

      # routes for auth controller for handling social logins
      post 'auth/:provider', to: 'auth#authenticate'

      #routes for users controller
      post '/users', to: 'users#create'
      get '/users/confirm_email', to: 'users#confirm_email'
      
      #routes for projects controller 
      post 'projects/fund_project', to: 'projects#fund_project'
      get 'projects/draft', to: 'projects#get_draft_project'
      post 'projects/launch', to: 'projects#launch'
      resources :projects, only: [:create, :index, :update, :destroy, :show]

      #routes for comments controller
      get 'comments/:project_id', to: 'comments#index'
      resources :comments, only: [:create, :update, :destroy]

      #routes for category controller
      resources :category, only: :index
    end
  end

end
