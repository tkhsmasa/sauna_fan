class Sauna < ApplicationRecord
  belongs_to :genre
  belongs_to :area
  
  has_one_attached :sauna_image
end
