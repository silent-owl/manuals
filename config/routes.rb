Rails.application.routes.draw do

  devise_for :users, :controllers => {registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks"}

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  
    match "/404", :to => "errors#not_found", :via => :all
    match "/500", :to => "errors#internal_server_error", :via => :all

    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

    root to: 'pages#index'

    devise_scope :user do
    	get 'login', to: 'devise/sessions#new'
        get 'signup', to: 'devise/registrations#new'
    end

    resources :users, :only => [:show, :destroy]

    resources :manuals, :only => [:show, :update, :edit, :destroy, :new]

    resources :manuals do
      resources :steps, :only => [:create, :update, :edit, :destroy]
    end

    resources :steps
  end
end


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.