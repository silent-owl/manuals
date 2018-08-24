class PagesController < ApplicationController
  def index
    manuals_for_category(params[:action])
  end 
  
  def get_manuals
    search = params[:search]
    category = params[:category]
    if category.blank? && search.blank?
      manuals = Manual.all
    elsif category.blank? && search.present?
      manuals = Manual.search(search)
    elsif category.present? && search.blank?
      manuals = Manual.by_category(category)
    elsif category.present? && search.present?
      manuals = Manual.by_category(category).search(search)
    else

    end
  end

  private
    def manuals_for_category(category)
      @categories = Category.all
      @manuals = get_manuals.paginate(:per_page => 10, :page => params[:page])
      respond_to do |format|
        format.html
        format.js { render partial: 'pages/manuals_pagination_page' }
      end
    end
end
