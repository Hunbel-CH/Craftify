class AddUserToHandcraftedItem < ActiveRecord::Migration[7.0]
  def change
    add_column :handcrafted_items, :user_id, :integer
  end
end
