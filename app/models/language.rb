class Language < ActiveRecord::Base
  has_many :project_languages
  has_many :projects, through: :project_languages
  
  before_save {self.name = name.downcase}
  
  validates :name, presence: true, length: { maximum: 15 }
end
