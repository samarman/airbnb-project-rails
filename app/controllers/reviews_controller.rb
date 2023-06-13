class ReviewsController < ApplicationController
  def create
    @planet = Planet.find(params[:planet_id])
    @review = Review.new(review_params)
    @review.planet = @planet
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to planet_path(@planet)
    else
      render planet_path(@planet), status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
