class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize! :read, @user
  end 

  def destroy
    authorize! :manage, @user
    @user = User.find(params[:id]).destroy
    if @user.destroy
      redirect_to root_path, :success => "User is deleted"
    end
  end
end
