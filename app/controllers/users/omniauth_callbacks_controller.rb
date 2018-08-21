class Users::OmniauthCallbacksController < ApplicationController
  def vkontakte
  	@user = User.vkontakte_from_omniauth(request.env["omniauth.auth"])    
    sign_in_and_redirect @user
  end
end
