class ProfilesController < ApplicationController

  def index
    if params[:query].present?
      @query = params[:query]
      @profiles = policy_scope(Profile.search_profiles(params[:query]))
    else
      @profiles = policy_scope(Profile)
    end
  end

  def new
    @profile = Profile.new
    @profile_category = ProfileCategory.new
    authorize @profile
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    authorize @profile
    if @profile.save
      params[:profile][:category_ids].delete("")
      params[:profile][:category_ids].each do |category|
        @profile_category = ProfileCategory.new(category_id: category.to_i, profile: @profile)
        @profile_category.save!
      end
      flash[:notice] = "#{@profile.user_name}'s profile has been saved"
      redirect_to profile_path(@profile)
    else
      render :new, status: :see_other
    end
  end

  def show
    @profile = Profile.find(params[:id])
    authorize @profile
    @lists = List.select { |list| list.user_id == @profile.user_id }
    @tools = Tool.select { |tool| tool.user_id == @profile.user_id }
    @friends = Friendship.select { |friendship| friendship.friend1_id == @profile.id || friendship.friend2_id == @profile.id}
    @friends_already = Friendship.select { |friendship| (friendship.friend1_id == @profile.id || friendship.friend2_id == @profile.id) && (friendship.friend1_id == current_user.profile.id || friendship.friend2_id == current_user.profile.id)}
    @chat_already = Chatroom.select { |chat| (chat.sender_id == @profile.user_id || chat.recipient_id == @profile.user_id) && (chat.sender_id == current_user.id || chat.recipient_id == current_user.id)}
  end

  def edit
    @profile = Profile.find(params[:id])
    authorize @profile
  end

  def update
    @profile = Profile.find(params[:id])
    authorize @profile
    if @profile.update(profile_params)
      flash[:notice] = "#{@profile.user_name}'s profile has been updated."
      redirect_to profile_path(@profile)
    else
      render :new, status: :see_other
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    authorize @profile
    @profile.delete
    redirect_to root_path, status: :see_other
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :bio, :score, :location, :user_name, :photo)
  end
end
