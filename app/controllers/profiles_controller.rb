class ProfilesController < ApplicationController

  #GET to /user/:user_id/profile/new
  def new
    @profile = Profile.new
  end

  #POST to /user/:user_id/profiles
  def create
    @user = User.find(params[:user_id])
    @profile = @user.build_profile( profile_params )

    if @profile.save
      flash[:success] = "Profile updated!"
      #redirect_to root_path
      redirect_to user_path(params[:user_id])
    else
      render :new
    end

  end


  private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description )
  end
end