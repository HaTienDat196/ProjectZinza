class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.integer :number
      t.string :image
      t.references :category

      t.timestamps
    end
  end
end
