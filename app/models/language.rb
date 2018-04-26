class Language < ActiveRecord::Base
  has_many :project_languages
  has_many :projects, through: :project_languages
  belongs_to :language_icon
  
  validates :name, presence: true, length: { maximum: 15 }
end
