class FriendshipsController < ApplicationController
  def index
    @friendships = policy_scope(Friendship)
    @profile = Profile.find(params[:profile_id])
  end

  def add_friend
    @friendship = Friendship.new
    authorize @friendship
    @friendship.friend1_id = current_user.profile.id
    @friend2 = Profile.find(params[:id])
    @friendship.friend2_id = @friend2.id
    if @friendship.save
      flash[:notice] = "#{@friend2.name} has been added to your friends list!"
      redirect_to profile_path(params[:id])
    else
      render :new
    end
  end
end
