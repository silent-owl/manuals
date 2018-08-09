class CreateManualCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :manual_categories do |t|
      t.belongs_to :manual, index: true
      t.belongs_to :category, index: true
      t.timestamps
    end
  end
end
