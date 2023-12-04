class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :handcrafted_item
end
