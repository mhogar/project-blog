class UserProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_profile, except: [:show, :new, :create]
  
  def show
    @user = User.find_by(user_name: params[:user_name])
    @profile = @user.user_profile
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
  
  private
    def profile_params
      params.require(:user_profile).permit(:about, :first_name, :last_name, :occupation, :user_id)
    end
    
    def set_profile
      @profile = current_user.user_profile
    end
end
