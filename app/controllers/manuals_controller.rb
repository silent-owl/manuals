class ManualsController < ApplicationController
  before_action :redirect_if_not_signed_in, only: [:new, :create, :edit, :update, :destroy]

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message , :notice => exception.message
  end
  
  def new
    @categories = Category.all
    @manual = Manual.new
    authorize! :create, @manual
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
    authorize! :read, @manual
    @manual = Manual.find(params[:id])
    @steps = @manual.steps.order("id").paginate(:per_page => 1, :page => params[:page])
  end

  def edit
    @categories = Category.all
    @manual = Manual.find(params[:id])
    @step = Step.new
    @steps = @manual.steps.order("count")
    authorize! :manage, @manual
  end

  def update
    @manual = Manual.find(params[:id])
    if @manual.update(manual_params_update)
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

  private
  def manual_params_update
    params.require(:manual).permit(:title, :img_url, :description, :category_id)
  end
  def manual_params
    manual_params_update.merge(user_id: current_user.id)
  end
end
