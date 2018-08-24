class ManualsController < ApplicationController
  before_action :redirect_if_not_signed_in, only: [:new, :create, :edit, :update, :destroy]
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
    @steps = @manual.steps.order("count").paginate(:per_page => 1, :page => params[:page])
  end

  def edit
    @categories = Category.all
    @manual = Manual.find(params[:id])
    @step = Step.new
    @steps = @manual.steps.order("count")
  end

  def update
    @manual = Manual.find(params[:id])
    if @manual.update(manual_params)
      redirect_to @manual, :notice => "Manual is updated"
    else
      render 'edit'
    end
  end

  def destroy
    @manual = Manual.find(params[:id]).destroy
    if @manual.destroy
      redirect_to root_path, :notice => "Manual is deleted"
    end
  end

  def manual_params
    params.require(:manual).permit(:title, :img_url, :description, :category_id)
                       .merge(user_id: current_user.id)
  end
end
