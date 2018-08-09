class UpdateColumnNameFromCategories < ActiveRecord::Migration[5.2]
  def change
    change_table :categories do |t|
      t.remove :CreateCategories  
      t.string :name, null: false, default: ""
    end
  end
end
