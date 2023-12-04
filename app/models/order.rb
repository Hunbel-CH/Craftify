class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  before_create :add_order_items_from_cart

  def add_order_items_from_cart(cart)
    self.order_items = cart.cart_items.map do |cart_item|
      OrderItem.new(
        handcrafted_item: cart_item.handcrafted_item,
        quantity: cart_item.quantity,
        price: cart_item.handcrafted_item.price
      )
    end
  end
end
