class ReviewsController < ApplicationController
before_action :set_view, only: [:show]

def show
end

def create
  @review = Review.new(review_params)
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review.restaurant = Restaurant.find(params[:restaurant_id])
  if @review.save
    redirect_to restaurant_path(@restaurant)
  else
    render :new
  end
end

def new
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = Review.new
end

private

def review_params
  params.require(:review).permit(:content, :rating)
end

def set_review
  @review = Review.find(params[:id])
end

end
