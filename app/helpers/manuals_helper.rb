module ManualsHelper
  def manual_nav_panel_path
      if user_signed_in?
        if ((current_user.role == "admin") || current_user.id == @manual.user.id)
        'manuals/show/nav_manual_panel/owner_admin_panel'
        else
          'manuals/show/nav_manual_panel/not_owner_admin_panel'
        end   
      else
        'manuals/show/nav_manual_panel/not_owner_admin_panel' 
      end
  end 

  def has_content_path
      if (@manual.steps.count >= 1)
        'manuals/show/content/has_steps'
      else
        'manuals/show/content/has_not_steps'
      end
  end
end
