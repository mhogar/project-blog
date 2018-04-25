class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def user_projects
    #@user = current_user
    @user = User.find(params[:id])
    @projects = @user.projects
  end
end