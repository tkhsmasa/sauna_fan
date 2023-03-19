class Sauna < ApplicationRecord
  belongs_to :genre
  belongs_to :area

  has_one_attached :sauna_image


  validates :name, presence: true
  validates :price, presence: true
  validates :is_active, presence: true
end
