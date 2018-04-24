class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] 
  
  def index
  end
  
  def show
    @project = Project.find(params[:id])
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
  
  private
    def project_params
      params.require(:project).permit(:name, :repo_link, :description)
    end
end
