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

  def category_field_partial_path
    if params[:category].present?
      'pages/index/search_form/category_field'
    else
      'shared/empty_partial'
    end
  end

  def create_new_manual_partial_path
    if user_signed_in?
      'pages/index/create_new_manual/signed_in'
    else
      'pages/index/create_new_manual/not_signed_in'
    end
  end
end
