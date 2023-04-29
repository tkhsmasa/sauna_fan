class Review < ApplicationRecord
  belongs_to :user
  belongs_to :sauna
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy


  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def created_at_ymd
    created_at.strftime('%Y/%m/%d')
  end


  validates :rate, numericality: {
  less_than_or_equal_to: 5,
  greater_than_or_equal_to: 1}, presence: true

end
