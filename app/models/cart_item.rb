class CartItem < ApplicationRecord
  belongs_to :handcrafted_item
  belongs_to :shopping_cart
  belongs_to :order, optional: true

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  def total_price
    self.handcrafted_item.price  ||= 0.0
    handcrafted_item.price * quantity
  end
end
