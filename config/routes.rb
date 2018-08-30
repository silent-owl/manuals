Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => {registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks"}
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root to: 'pages#index'
    devise_scope :user do
    	get 'login', to: 'devise/sessions#new'
    	get 'signup', to: 'devise/registrations#new'
    end
    resources :users, :only => [:show, :index, :destroy, :update]
    delete 'users/delete_users', :as => :delete_users
    post 'users/ban_users', :as => :ban_users
    post 'users/default_users', :as => :default_users
    post 'users/admin_to_users', :as => :admin_to_users
    # post 'users/:id/admin_role', :as => :admin_role

    resources :manuals do
       
    	# collection do
    	# 	# get 'crafts'
    	# end
    end
    resources :steps
  end
end


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.