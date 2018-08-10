class AddIdCategoryToManual < ActiveRecord::Migration[5.2]
  def change
  	change_table :manuals do |t|
      t.belongs_to :category, index: true
    end
  end
end
