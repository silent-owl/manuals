class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.string :name, default: ""
      t.text :description, default: ""
      t.integer :number, default: 0
      t.belongs_to :manual, default: "", index: true
      t.text :img_url, default: ""
      t.timestamps
    end
  end
end
