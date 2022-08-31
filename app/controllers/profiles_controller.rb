class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
    authorize @profile
    @user_category = UserCategory.new
  end

  def create
    @profile = Profile.new(profile_params)
    authorize @profile
    @profile.user = current_user
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

  def show
    @profile = Profile.find(params[:id])
    authorize @profile
    @lists = List.select { |list| list.user_id == @profile.user_id }
    @tools = Tool.select { |tool| tool.user_id == @profile.user_id }
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
      render :new
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    authorize @profile
    @profile.delete
    redirect_to root_path
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :bio, :score, :location, :user_name, :photo)
  end
end
