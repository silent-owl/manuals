class ManualsController < ApplicationController
  before_action :redirect_if_not_signed_in, only: [:new]
  def new
    @categories = Category.all
    @manual = Manual.new
  end

  def create
    @manual = Manual.new(manual_params)
    if @manual.save 
      redirect_to manual_path(@manual) 
    else
      redirect_to root_path
    end
  end

  def show
    @manual = Manual.find(params[:id])
  end

  def manual_params
    params.require(:manual).permit(:title, :img_url, :description, :category_id)
                       .merge(user_id: current_user.id)
  end
end
