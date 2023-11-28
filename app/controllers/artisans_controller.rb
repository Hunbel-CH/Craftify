class ArtisansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_artisan, only: [:show, :edit, :update, :destroy]

  def index
    @artisans = User.where(role: :artisan)
  end

  def show
    # Show artisan details and handcrafted items
  end

  def new
    @artisan = current_user
  end

  def create
    # Create artisan profile
  end

  def edit
    # Edit artisan profile
  end

  def update
    # Update artisan profile
  end

  def destroy
    # Destroy artisan profile
  end

  private

  def set_artisan
    @artisan = User.find(params[:id])
  end
end
