class UserProfile < ActiveRecord::Base
  belongs_to :user
  
  validates :about, allow_blank: true, length: { minimum: 10, maximum: 300 }
  validates :first_name, allow_blank: true, length: { maximum: 15 }
  validates :last_name, allow_blank: true, length: { maximum: 15 }
  validates :occupation, allow_blank: true, length: { maximum: 20 }
  validates :user_id, presence: true
end
