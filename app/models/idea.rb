class Idea < ApplicationRecord

  mount_uploader :image, ImageUploader
  
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :users, through: :like

  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships

  def like_for(user)
      likes.find_by_user_id(user)
  end
 def membership_for(user)
   memberships.find_by_user_id(user)
 end

end
