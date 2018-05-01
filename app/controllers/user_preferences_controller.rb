class UserPreferencesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_preferences, except: [:destory]

  def edit
  end
  
  def update
    if @preferences.update(preferences_params)
      flash[:success] = "Preferences was succcessfully updated"
      redirect_to user_profile_path(current_user)
    else
      render 'edit'
    end
  end
  
  def destroy
    current_user.user_preference = UserPreference.new
    current_user.save
    
    flash[:success] = "Preferences restored to default"
    redirect_to user_profile_path(current_user)
  end
  
  private
    def preferences_params
      params.require(:user_preference).permit(:use_real_name, :profile_private)
    end
    
    def set_preferences
      @preferences = current_user.user_preference
    end
end
