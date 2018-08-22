class AddRoleColumnToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :role, :string, default: "user", null: false
  end
end
