class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :projects, dependent: :destroy
  has_one :user_profile, dependent: :destroy
  
  VALID_USER_NAME_REGEX = /[^(a-zA-Z0-9_)]/
  validates :user_name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 15 }, 
          format: {without: VALID_USER_NAME_REGEX, message: "No special characters: only letters, numbers, and underscores" }
  
  #override
  def to_param
    user_name
  end
  
  def display_name
    user_name
  end
end
