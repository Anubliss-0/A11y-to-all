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
    raise
    if @list.save
      params[:list][:tool_ids].delete("")
      params[:list][:tool_ids].each do |tool|
        @bookmark = Bookmark.new(tool_id: tool.to_i, list: @list)
        @bookmark.save!
      end
      UpdateScoreJob.perform
      flash[:notice] = "#{@list.title} has been saved"
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
    authorize @list
  end

  def update
    @list = List.find(params[:id])
    authorize @list
    if @list.update(list_params)
      @bookmarks = Bookmark.select { |bookmark| bookmark.list_id == @list.id }
      @bookmarks.each do |bookmark|
        bookmark.delete
      end
      params[:list][:tool_ids].delete("")
      params[:list][:tool_ids].each do |tool|
        @bookmark = Bookmark.new(tool_id: tool.to_i, list: @list)
        @bookmark.save!
      end
    flash[:notice] = "#{@list.title} has been updated."
    redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    authorize @list
    @list.destroy
    @user = current_user
    flash[:notice] = "#{@list.title} has been deleted."
    redirect_to "/profiles/#{@user.id}"
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end
end
