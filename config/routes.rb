Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      post 'auth/:provider', to: 'auth#authenticate'
      get 'projects/draft', to: 'projects#get_draft_project'
      resources :projects, only: [:create, :index, :update, :destroy, :show]
      resources :category, only: :index
    end
  end

end
