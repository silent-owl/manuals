class ManualsController < ApplicationController
  before_action :redirect_if_not_signed_in, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:edit, :update, :destroy]
  respond_to :js, :json, :html

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, flash: {error: t('manuals_controller.flash.exeption_can_can')} 
  end
  
  def new
    @categories = Category.all
    @manual = Manual.new
    authorize! :create, @manual
  end

  def create
    @manual = Manual.new(manual_params)
    respond_to do |format|
      if @manual.save 
        format.html { redirect_to @manual, flash: {success: t('manuals_controller.flash.manual_is_created')} }
        format.json { render :show, status: :created, location: @manual }
      else
        format.html { redirect_to @manual, flash: {error: t('manuals_controller.flash.manual_is_not_created')}  }
        format.json { render json: @manual.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    authorize! :read, @manual
    @manual = Manual.find(params[:id])
    @steps = @manual.steps.order("count").paginate(:per_page => 1, :page => params[:page])
    respond_to do |format|
      format.html 
      format.json { render json: @steps }
      format.js
      # format.pdf do
      #   render pdf: "#{@manual.title}",
      #   template: "manuals/pdf.html.erb",
      #   layout: 'pdf.html',
      #   encoding: "utf8"
      # end
    end
  end

  def edit
    authorize! :manage, @manual
    @categories = Category.all
    @step = Step.new
    @steps = @manual.steps.order("count")
  end

  def update
    respond_to do |format|
      if @manual.update(manual_params_update)
        format.html { redirect_to @manual, flash: {success: t('manuals_controller.flash.manual_is_updated')}}
        format.json { render :show, status: :ok, location: @manual }
      else
        format.html { redirect_to @manual, flash: {erorr: t('manuals_controller.flash.manual_is_not_updated')} }
        format.json { render json: @manual.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @manual.destroy
    if @manual.destroy
      respond_to do |format|
        format.html { redirect_to root_path, flash: {success: t('manuals_controller.flash.manual_is_deleted')} }
        format.json { head :no_content }
      end
    end
  end

  private
  def set_post
    @manual = Manual.find(params[:id])
  end

  def manual_params_update
    params.require(:manual).permit(:title, :img_url, :description, :category_id)
  end

  def manual_params
    manual_params_update.merge(user_id: current_user.id)
  end
end
