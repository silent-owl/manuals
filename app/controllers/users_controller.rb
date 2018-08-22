class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end 

  def delete_users
    if params[:user_check]
      User.where(id: params[:user_check]).destroy_all
    end 
    redirect_to users_url
  end

  def ban_users
    if params[:user_check]
      User.where(id: params[:user_check]).update_all(role:"banned")
    end  
    redirect_to users_url
  end

  def default_users
    if params[:user_check]
      User.where(id: params[:user_check]).update_all(role:"user")
    end
    redirect_to users_url
  end

  def admin_to_users
    if params[:user_check]
      User.where(id: params[:user_check]).update_all(role:"admin")
    end  
    redirect_to users_url
  end
end
