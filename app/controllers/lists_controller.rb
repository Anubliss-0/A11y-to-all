class ListsController < ApplicationController
  def new
    @list = List.new
    authorize @list
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    authorize @list
    if @list.save?
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def show
    @list = List.find_by(params[:id])
    authorize @list
  end

  private

  def list_params
    params.require(:list).permit(:title, :tool_id)
  end
end
