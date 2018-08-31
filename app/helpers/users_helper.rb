module UsersHelper
  def has_achievements_table_partial_path
    if current_user.badges.count == 0
      'users/show/achievements_section/has_not_achievements'
    else
      'users/show/achievements_section/has_achievements'
    end 
  end

  def has_manuals_table_partial_path
    if current_user.manuals.count == 0
      'users/show/manuals_table/has_not_manuals'
    else
      'users/show/manuals_table/has_manuals'
    end 
  end
end
