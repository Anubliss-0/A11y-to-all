class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    authorize @bookmark
    @lists = List.select { |list| list.user_id == current_user.id }
    @tool = Tool.find(params[:tool_id])
  end

  def create

  end
end
