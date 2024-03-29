class RestaurantsController < ApplicationController
  before_action
  def new
    @restaurant = Restaurant.new
  end
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to "/restaurants/"
  end
  def show
    @restaurant = Restaurant.find(params[:id])
  end
  def index
    @restaurants = Restaurant.page(params[:page]).per(2)
  end
  def edit
    @restaurant = Restaurant.find(params[:id])
  end
  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to "/"
  end
  private
  def restaurant_params
    params.require(:restaurant).permit(
      :name,
      :address,
      :explain,
      :tel,
      :pic,
      :admin_id)
  end
end
