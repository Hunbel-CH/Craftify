class HandcraftedItem < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :cart_items, dependent: :destroy
  has_many :order_items
end
