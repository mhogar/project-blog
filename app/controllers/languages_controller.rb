class LanguagesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_lang, only: [:edit, :update]
  
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
  
  private
    def lang_params
      params.require(:language).permit(:name)
    end
    
    def set_lang
      @lang = Language.find(params[:id])
    end
end
