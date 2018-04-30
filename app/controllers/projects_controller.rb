class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_project, except: [:index, :new, :create]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @user = User.find_by(user_name: params[:user_name])
    @projects = @user.projects.paginate(page: params[:page], per_page: 10)
  end
  
  def show
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(project_params)
    @project.user = current_user
    
    if @project.save
      flash[:success] = "Project was successfully created"
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @project.update(project_params)
      flash[:success] = "Project was succcessfully updated"
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end
  
  def destroy
    user = @project.user
    @project.destroy
    flash[:success] = "Project was succcessfully deleted"
    redirect_to user_projects_path(user.id)
  end
  
  private
    def project_params
      params.require(:project).permit(:name, :repo_link, :description, language_ids: [])
    end
    
    def set_project
      @project = Project.find(params[:id])
    end
    
    def require_same_user
      if current_user != @project.user
        flash[:danger] = "You can only edit or delete your own projects"
        redirect_to root_path
      end
    end
end
