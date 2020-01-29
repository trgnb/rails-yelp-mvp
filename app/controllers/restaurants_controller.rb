class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    set_restaurant
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(params.require(:restaurant).permit(:name, :address, :phone_number, :category))
    @restaurant.save
    redirect_to(restaurant_path)
  end
end

private
def set_restaurant
  @restaurant = Restaurant.find(params[:id])
end
