class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit destroy update]
  before_action :set_tool, only: %i[new create]

  def new
    @review = Review.new
    authorize @review
  end



  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.tool = @tool

    authorize @review

    if @review.save
      flash[:notice] = "Your review has been created!"
      UpdateScoreJob.perform_now(current_user)
      UpdateToolRatingJob.perform_now(@tool, current_user)
      redirect_to tool_path(@tool)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @review
  end

  def update
    authorize @review
    if @review.update(review_params)
      flash[:notice] = "Your review has been updated"
      redirect_to tool_path(@review.tool)
    else
      render :new
    end
  end

  def destroy
    authorize @review
    @tool = @review.tool
    @review.destroy
    flash[:notice] = "Your review has been deleted"
    redirect_to tools_path()
  end

  private

  def set_tool
    @tool = Tool.find(params[:tool_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
