class StepsController < ApplicationController
  def create
    @manual = Manual.find(params[:manual_id])
    @step = Step.new(:manual => @manual)
    @step = Step.create(step_params)
    @step.description = ""
    if @step.save 
      redirect_to manual_edit_path(@manual) 
    else
      redirect_to manual_edit_path(@manual)
    end
  end

  def destroy
    @step.destroy     
  end

  def update
    @step = Step.find(params[:id])
    if @step.update(step_params)
      redirect_to manual_edit_path(@manual)
    end
  end
  # def sort
  #   params[:order].each do |key,value|
  #     Step.find(value[:id]).update_attribute(:count, value[:count])
  #   end
  # end

  def step_params
    params.require(:step).permit(:title, :description, :img_url, :count, :manual_id)             
  end
end
