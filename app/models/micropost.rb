class Micropost < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }

  has_many :likes
  has_many :like_users, through: :likes, source: :user

  def like?(user)
    likes.where(user_id: user.id).exists?
  end

end