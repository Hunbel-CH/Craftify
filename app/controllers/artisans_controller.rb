class ArtisansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_artisan, only: [:show, :edit, :update, :destroy]


  def index
    @artisans = User.where(role: :artisan)
  end

  def show
    @handcrafted_items = @artisan.handcrafted_items
    @new_handcrafted_item = HandcraftedItem.new
  end

  def new
    @artisan = current_user
  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def set_artisan
    @artisan = User.find(params[:id])
  end
end
