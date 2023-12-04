class ShoppingCartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: %i[add_item show remove_item]

  def show
    @cart_items = @cart.cart_items.includes(:handcrafted_item)
  end

  def add_item
    handcrafted_item = HandcraftedItem.find_by_id(params[:handcrafted_item_id])
    @cart_item = @cart.cart_items.find_or_initialize_by(handcrafted_item: handcrafted_item)
    @cart_item.quantity += 1

    if @cart_item.save
      redirect_to root_path, notice: 'Item added to the cart.'
    else
      redirect_to root_path, alert: 'Error adding product to cart.'
    end
  end

  def remove_item
    cart_item = @cart.cart_items.find(params[:id])
    cart_item.destroy
    redirect_to shopping_cart_path, notice: 'Item removed from the cart.'
  end

  private

  def set_cart
    if user_signed_in?
      @cart = current_user.shopping_cart || current_user.create_shopping_cart
    end
  end
end
