class Genre < ApplicationRecord
  has_many :saunas, dependent: :destroy

 
end
