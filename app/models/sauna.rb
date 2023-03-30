class Sauna < ApplicationRecord
  belongs_to :genre

  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true
  validates :is_active, inclusion: {in: [true, false]}
  validates :sales_state, inclusion: {in: [true, false]}

  has_one_attached :sauna_image

  def get_sauna_image(width, height)
    unless sauna_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      sauna_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    sauna_image.variant(resize_to_limit: [width, height]).processed
  end

  def add_tax_price
    (price * 1.10).floor.to_s(:delimited) + '円'
  end

  def address_display
    '〒' + postal_code + ' ' + address1+ ' ' + address2+ ' ' + address3
  end

  def bookmark_by?(user)
    bookmarks.exists?(user_id: user.id)
  end



end
