class HandcraftedItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_artisan
  before_action :set_handcrafted_item, only: [:edit, :update, :destroy]

  def new
    @handcrafted_item = HandcraftedItem.new
  end

  def create
    @handcrafted_item = @artisan.handcrafted_items.build(handcrafted_item_params)

    if @handcrafted_item.save
      redirect_to artisan_path(@artisan), notice: 'Handcrafted item added successfully.'
    else
      render :new
    end
  end

  # ... (other actions)

  private

  def set_artisan
    @artisan = User.find(params[:artisan_id])
  end

  def set_handcrafted_item
    @handcrafted_item = @artisan.handcrafted_items.find(params[:id])
  end

  def handcrafted_item_params
    params.require(:handcrafted_item).permit(:name, :description, :price, :image)
  end
end
