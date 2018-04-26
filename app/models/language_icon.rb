class LanguageIcon < ActiveRecord::Base
  has_many :languages
  mount_uploader :image, ImageUploader
  validates :image, presence: true
end
