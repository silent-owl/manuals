class ChangeNameOfNumberColumnInSteps < ActiveRecord::Migration[5.2]
  def change
  	rename_column :steps, :number, :count
  end
end
