class CreateCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_items do |t|
      t.references :handcrafted_item, null: false, foreign_key: true
      t.references :shopping_cart, null: false, foreign_key: true
      t.integer :quantity, default: 0

      t.timestamps
    end
  end
end
