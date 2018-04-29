class LanguagesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_lang, except: [:index, :new, :create]
  
  def index
    @langs = Language.all
  end
  
  def new
    @lang = Language.new
  end
  
  def create
    @lang = Language.new(lang_params)
    
    if @lang.save
      flash[:success] = "Language was successfully created"
      redirect_to languages_path
    else
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if @lang.update(lang_params)
      flash[:success] = "Language was succcessfully updated"
      redirect_to languages_path(@lang)
    else
      render 'edit'
    end
  end
  
  def destroy
    @lang.destroy
    flash[:success] = "Language was succcessfully deleted"
    redirect_to languages_path
  end
  
  private
    def lang_params
      params.require(:language).permit(:name, :language_icon_id)
    end
    
    def set_lang
      @lang = Language.find(params[:id])
    end
end
