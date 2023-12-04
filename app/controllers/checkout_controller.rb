class CheckoutController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.build(order_params)
    @order.build_order_items_from_cart(@cart)

    if @order.save
      @cart.destroy
      redirect_to order_path(@order), notice: 'Order placed successfully.'
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:shipping_address, :payment_method)
  end

  def set_cart
    @cart = current_user.shopping_cart || current_user.create_shopping_cart
  end
end
