class StepsController < ApplicationController
  before_action :set_step, only: [:destroy, :update]
  # skip_before_action :verify_authenticity_token
  respond_to :js, :json, :html

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, flash: {success: exception.message} 
  end
  
  def edit
    @step = Step.find(params[:id])
    authorize! :manage, @step
  end

  def create
    @manual = Manual.find(params[:manual_id])
    @step = Step.new(:manual => @manual)
    @step = Step.create(step_params)
    @step.description = ""
    respond_to do |format|
      if @step.save
        format.html { redirect_to edit_manual_path(@manual.id), flash: {success: 'Step was successfully created.'}}
        format.json { render :show, status: :created, location: @step }
      else
        format.html { redirect_to edit_manual_path(@manual.id), flash: {success: 'Step was not created.'}}
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @step.destroy  
    respond_to do |format|
      format.html { redirect_to edit_manual_path(@step.manual.id) }
      format.json { head :no_content }
    end   
  end

  def update
    respond_to do |format|
      if @step.update(step_params)
        format.html { redirect_to edit_manual_path(@step.manual_id), flash: {success: 'Step was successfully updated.'} }
        format.json { render :show, status: :ok, location: @step }
      else
        format.html { render :edit }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def step_params
    params.require(:step).permit(:title, :description, :img_url, :count, :manual_id)             
  end

  def set_step
    @step = Step.find(params[:id])
  end
end
