class DeleteTableManualCategory < ActiveRecord::Migration[5.2]
  def change
  	drop_table :manual_categories
  end
end
