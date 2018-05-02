class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable, :timeoutable
         
  has_many :projects, dependent: :destroy
  has_one :user_profile, dependent: :destroy
  has_one :user_preference, dependent: :destroy
  
  VALID_USER_NAME_REGEX = /[^(a-zA-Z0-9_)]/
  validates :user_name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 15 }, 
          format: {without: VALID_USER_NAME_REGEX, message: "No special characters: only letters, numbers, and underscores" }
          
  #validates :user_preference, presence: true
  
  def display_name
    user_profile.full_name.blank? ? user_name : (user_preference.use_real_name? ? "#{user_profile.full_name} (#{user_name})" : user_name)
  end
  
  #override
  def remember_me
    true
  end
  
  #override
  def to_param
    user_name
  end
end
