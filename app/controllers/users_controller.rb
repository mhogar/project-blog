class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def my_projects
    @user = current_user
    @projects = current_user.projects
  end
end