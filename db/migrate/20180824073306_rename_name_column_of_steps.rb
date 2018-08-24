class RenameNameColumnOfSteps < ActiveRecord::Migration[5.2]
  def change
  	rename_column :steps, :name, :title
  end
end
