class HomeController < ApplicationController
  def index
    @handcrafted_items = HandcraftedItem.all
  end
end
