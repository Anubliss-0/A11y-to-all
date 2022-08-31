class ProfilesController < ApplicationController
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
