class HandcraftedItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_handcrafted_item, only: [:edit, :update, :destroy]

  def new
    @handcrafted_item = HandcraftedItem.new
  end

  def index
    @handcrafted_items = current_user.handcrafted_items
  end

  def create
    @handcrafted_item = current_user.handcrafted_items.build(handcrafted_item_params)

    if @handcrafted_item.save
      redirect_to user_handcrafted_items_path, notice: 'Handcrafted item added successfully.'
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @handcrafted_item.update(handcrafted_item_params)
      redirect_to user_handcrafted_items_path, notice: 'Handcrafted item updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    if @handcrafted_item.destroy
      redirect_to user_handcrafted_items_path, notice: 'Handcrafted item deleted successfully.'
    else
      redirect_to user_handcrafted_items_path, alert: 'Failed to delete handcrafted item.'
    end
  end

  private

  def set_handcrafted_item
    @handcrafted_item = current_user.handcrafted_items.find(params[:id])
  end

  def handcrafted_item_params
    params.require(:handcrafted_item).permit(:name, :description, :price, :image)
  end
end
