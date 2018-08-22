class DeleteColumnsFromUsers < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :admin, :boolean
  	remove_column :users, :banned, :boolean
  end
end
