class CreateManuals < ActiveRecord::Migration[5.2]
  def change
    create_table :manuals do |t|
      t.string :title, null: false, default: ""
      t.text :img_url, null:false, default: ""
      t.text :description, null:false, default: ""
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
