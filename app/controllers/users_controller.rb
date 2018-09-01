class UsersController < ApplicationController
  respond_to :js, :json, :html
  def show
    @user = User.find(params[:id])
    authorize! :read, @user
    respond_to do |format|
      format.html 
      format.json { render json: @user }
      format.js
    end
  end 

  def destroy
    authorize! :manage, @user
    @user = User.find(params[:id]).destroy
    if @user.destroy
      respond_to do |format|
        format.html { redirect_to root_path, flash: {success: t('users_controller.flash.account_is_deleted')} }
        format.json { head :no_content }
      end
    end
  end
end
