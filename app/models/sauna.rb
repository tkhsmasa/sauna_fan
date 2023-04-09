class Sauna < ApplicationRecord
  belongs_to :genre

  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true
  validates :is_active, inclusion: {in: [true, false]}
  validates :sales_state, inclusion: {in: [true, false]}

  has_many_attached :sauna_images

  scope :is_active, -> { where(is_active: false) }

  scope :search, -> (search_params) do
    return if search_params.blank?

  end

  def get_sauna_images(width, height)
    unless sauna_images.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      sauna_images.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    # sauna_images.variant(resize_to_limit: [width, height]).processed
      sauna_images.each do |image|
        image.variant(resize_to_limit: [width, height]).processed
      end
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
