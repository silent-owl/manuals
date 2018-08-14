module PagesHelper
  def all_categories_button_partial_path
      if params[:category].blank?
        'pages/index/side_menu/all_selected'
      else
        'pages/index/side_menu/all_not_selected'
      end
    end
    def no_manuals_partial_path
      @manuals.empty? ? 'pages/index/no_manuals' : 'shared/empty_partial'
    end
end
