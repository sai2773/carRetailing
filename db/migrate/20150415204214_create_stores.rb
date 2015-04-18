class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :model
      t.string :make
      t.integer :year
      t.string :color
      t.decimal :price
      t.text :description
      t.text :feature1
      t.text :feature2
      t.text :feature3
      t.text :feature4
      t.attachment :image

      t.timestamps null: false
    end
  end
end
