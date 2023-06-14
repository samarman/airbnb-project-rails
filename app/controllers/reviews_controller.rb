class ReviewsController < ApplicationController
  def create
    @planet = Planet.find(params[:planet_id])
    @review = Review.new(review_params)
    @review.planet = @planet
    @review.user = current_user
    authorize @review
    respond_to do |format|
      if @review.save
        format.html { redirect_to planet_path(@planet) }
        format.json
      else
        format.html { render planet_path(@planet), status: :unprocessable_entity }
        format.json
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
