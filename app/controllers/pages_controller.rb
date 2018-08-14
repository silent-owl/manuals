class PagesController < ApplicationController
  def index
    manuals_for_category(params[:action])
  end 
  def get_manuals
    Manual.limit(10)
  end
  private
    def manuals_for_category(category)
      @categories = Category.all
      @manuals = get_manuals.paginate(page: params[:page])
    end
end
