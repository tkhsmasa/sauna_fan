class Sauna < ApplicationRecord
  belongs_to :genre
  belongs_to :area

  validates :name, presence: true
  validates :price, presence: true
  validates :is_active, presence: true

  has_one_attached :sauna_image

  def get_sauna_image(width, height)
    unless sauna_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      sauna_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    sauna_image.variant(resize_to_limit: [width, height]).processed
  end

  def add_tax_price
    (price * 1.10).floor
  end
end
