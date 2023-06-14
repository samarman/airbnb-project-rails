if @review.persisted?
  json.form render(partial: "reviews/form", formats: :html, locals: {planet: @planet, review: Review.new})
  json.inserted_item render(partial: "planets/review", formats: :html, locals: {review: @review})
else
  json.form render(partial: "reviews/form", formats: :html, locals: {planet: @planet, review: @review})
end
