class Project < ActiveRecord::Base
  belongs_to :user
  has_many :project_languages
  has_many :languages, through: :project_languages
  
  validates :name, presence: true, length: { minimum: 3, maximum: 30 }
  validates :description, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :repo_link, allow_blank: true, length: { minimum: 3, maximum: 30 }
  validates :user_id, presence: true
end
