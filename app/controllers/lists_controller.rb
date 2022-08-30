class ListsController < ApplicationController
  def new
    @list = List.new
    @bookmark = Bookmark.new
    authorize @list
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    authorize @list
    if @list.save
      params[:list][:tool_ids].delete("")
      tool_ids =  params[:list][:tool_ids]
      tool_ids.each do |tool|
        tool.to_i
        @bookmark = Bookmark.new(tool_id: tool, list_id: @list.id)
        @bookmark.save!
      end
    redirect_to list_path(@list)
    else
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
    authorize @list
    @bookmarks = Bookmark.all
    @tools = Tool.all
    @bookmarks_needed = @bookmarks.select { |bookmark| bookmark.list_id == @list.id }
  end

  def edit
    @list = List.find(params[:id])
    @bookmarks = Bookmarks.all
    @bookmarks_needed = @bookmarks.select { |bookmark| bookmark.list_id = @list.id}
    authorize @list
  end

  def update
    @list = List.find(params[:id])
    authorize @list
    @list.bookmarks.clear
    if params.key?(:bookmarks)
      params[:bookmarks].each do |bookmark|
        @list.bookmarks << Bookmark.find_by(bookmark.id)
      end
    end
    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list = List.find_by(params[:id])
    authorize @list
    @list.destroy
    user = current_user
    redirect_to "profiles/#{user.id}"
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end

  def bookmark_params
    params.require(:bookmark).permit(:tool_id)
  end
end
