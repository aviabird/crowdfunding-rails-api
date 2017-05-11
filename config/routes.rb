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
      get '/users/confirm_email', to: 'users#confirm_email'
      get '/users/get_user_kyc_info', to: 'users#get_user_kyc_info'
      post '/users/update_profile_pic', to: 'users#update_profile_pic'
      post '/users/update_user_kyc_info', to: 'users#update_user_kyc_info'
      resources :users, only: [:create, :show, :update]
      
      #routes for projects controller 
      get 'projects/view_project_from_mail', to: 'projects#view_project_from_mail'
      get 'projects/draft', to: 'projects#get_draft_project'
      post 'projects/launch', to: 'projects#launch'
      get 'projects/categories/:category', to: 'projects#search_by_category'
      post 'projects/report_project', to: 'projects#report_project'
      resources :projects, only: [:create, :index, :update, :destroy, :show]

      #routes for comments controller
      get 'comments/:project_id', to: 'comments#index'
      resources :comments, only: [:create, :update, :destroy]

      #routes for category controller
      resources :category, only: :index

      #routes for notifications controller
      put 'notifications/read_notification', to: 'notifications#read_notification'

      #routes for stripe controller
      post 'pay_by_card', to: 'stripe#card_payments'
      post 'pay_by_sofort', to: 'stripe#sofort_payments'
      post 'webhook', to: 'stripe#webhook'

      #routes for rewards controller
      resources :rewards, only: [:index, :show]    

    end
  end

end
