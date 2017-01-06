class ProfilesController < ApplicationController

  before_action :authenticate_user!

  # Only current user can edit your own profile.
  before_action :only_curretn_user

  before_action :set_user, only: [:create, :edit, :update]

  #GET to /user/:user_id/profile/new
  def new
    @profile = Profile.new
  end

  #POST to /user/:user_id/profiles
  def create
    @profile = @user.build_profile( profile_params )

    if @profile.save
      flash[:success] = "Profile updated!"
      #redirect_to root_path
      redirect_to user_path(params[:user_id])
    else
      render :new
    end
  end

  # GET to /user/:user_id/profile/edit
  def edit
    @profile = @user.profile
  end

  # PATCH to /user/:user_id/profile
  def update
    @profile = @user.profile

    if @profile.update_attributes(profile_params)
      flash[:success] = "Profile updated!"
      redirect_to user_path(id: params[:user_id])
    else
      render :edit
    end
  end


  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description )
  end

  def only_current_user
    @user = User.find(params[:user_id])
    redirect_to(root_url) unless @user == current_user
  end
end