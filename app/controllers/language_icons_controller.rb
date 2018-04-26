class LanguageIconsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_icon, except: [:new, :create]
  
  def new
    @lang_icon = LanguageIcon.new
  end
  
  def create
    @lang_icon = LanguageIcon.new(icon_params)
    
    if @lang_icon.save
      flash[:success] = "Language Icon was successfully created"
      redirect_to new_language_path
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @lang_icon.update(icon_params)
      flash[:success] = "Language Icon was succcessfully updated"
      redirect_to new_language_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @lang_icon.destroy
    flash[:success] = "Language Icon was succcessfully deleted"
    redirect_to new_language_path
  end
  
  private
    def icon_params
      params.require(:language_icon).permit(:image)
    end
    
    def set_icon
      @lang_icon = LanguageIcon.find(params[:id])
    end
end
