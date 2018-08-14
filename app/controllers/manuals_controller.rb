class ManualsController < ApplicationController
  def show
    @manual = Manual.find(params[:id])
  end
end
