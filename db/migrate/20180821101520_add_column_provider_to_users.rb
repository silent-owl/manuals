class AddColumnProviderToUsers < ActiveRecord::Migration[5.2]
  def change
  	change_table :users do |t|
      t.string :provider, null: false, default: ""
      t.string :uid, null: false, default: ""
    end
  end
end
