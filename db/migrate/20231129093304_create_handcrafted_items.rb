class CreateHandcraftedItems < ActiveRecord::Migration[7.0]
  def change
    create_table :handcrafted_items do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 8, scale: 2
      t.string :image

      t.timestamps
    end
  end
end
