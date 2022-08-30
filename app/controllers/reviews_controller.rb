class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]



  private

  def set_tool
    @tool = Tool.find(params[:id])
  end
end
