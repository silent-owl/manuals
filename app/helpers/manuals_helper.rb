module ManualsHelper

  def has_content_path
      if (@manual.steps.count >= 1)
        'manuals/show/content/has_steps'
      else
        'manuals/show/content/has_not_steps'
      end
  end
end
