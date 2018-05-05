class Language < ActiveRecord::Base
  has_many :project_languages
  has_many :projects, through: :project_languages
  belongs_to :language_icon
  
  validates :name, presence: true, length: { maximum: 15 }
  
  def icon_image
    if language_icon.nil? || !File.file?(language_icon.image.current_path)
      "default_icon.png"
    else
      language_icon.image
    end
  end
end
