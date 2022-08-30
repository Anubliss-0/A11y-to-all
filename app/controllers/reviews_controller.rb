class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]

  def new
    @review = Review.new
    authorize @review
  end

  def edit
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user

    authorize @review

    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def update
    authorize @review
    if @review.update(review_params)
      flash[:notice] = "#{@review.title} has been updated"
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def destroy
    authorize @review
    @review.destroy
    flash[:notice] = "Your review has been deleted"
    # How to redirect to tool page?!
  end

  private

  def set_tool
    @tool = Tool.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
