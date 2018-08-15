class AddDefaultUrlToManuals < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :manuals, :img_url, from: "", to: "https://pp.userapi.com/c849236/v849236504/4b7bb/IQIQwnnhuF0.jpg"
  end
end
