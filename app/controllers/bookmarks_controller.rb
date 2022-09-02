class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    authorize @bookmark
    @lists = List.select { |list| list.user_id == current_user.id }
    @tool = Tool.find(params[:tool_id])
  end

  def create
    params[:bookmark][:list_id].delete("")
    params[:bookmark][:list_id].each do |list|
      @bookmark = Bookmark.new(bookmark_params)
      authorize @bookmark
      @bookmark.list_id = list
      @tool = Tool.find(params[:tool_id])
      @bookmark.tool_id = @tool.id
      @bookmark.save
    end
    redirect_to profile_path(current_user.profile)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    @list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(@list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:list_id)
  end
end
