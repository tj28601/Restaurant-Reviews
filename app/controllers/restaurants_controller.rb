class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      flash[:notice] = "Restaurant added successfully!"
      redirect_to restaurant_path(@restaurant)
    else
      flash[:error] = @restaurant.errors.full_messages.join(". \n")
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :state, :zip, :description)
  end
end
