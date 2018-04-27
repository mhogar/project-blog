class UserProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_profile, except: [:show, :new, :create]
  
  def show
    @user = User.find(params[:user_id])
    @profile = @user.user_profile
  end
  
  def new
    if current_user.user_profile.nil?
      @profile = UserProfile.new
    else
      flash[:danger] = "Your profile already exists"
      redirect_to user_profile_path(current_user)
    end
  end
  
  def create
    @profile = UserProfile.new(profile_params)
    @profile.user = current_user
    
    if @profile.save
      flash[:success] = "Profile was successfully created"
      redirect_to user_profile_path(current_user)
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @profile.update(profile_params)
      flash[:success] = "Profile was succcessfully updated"
      redirect_to user_profile_path(current_user)
    else
      render 'edit'
    end
  end
  
  def destroy
    @profile.destroy
    flash[:success] = "Profile was succcessfully deleted"
    redirect_to user_profile_path(current_user)
  end
  
  private
    def profile_params
      params.require(:user_profile).permit(:about, :first_name, :last_name, :occupation, :user_id)
    end
    
    def set_profile
      @profile = current_user.user_profile
    end
end
