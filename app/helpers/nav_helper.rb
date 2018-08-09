module NavHelper
  def collapsible_links_partial_path
      if user_signed_in?
        'layouts/nav/collapsible_elements/signed_in_links'
      else
        'layouts/nav/collapsible_elements/non_signed_in_links'
      end                 
  end
end