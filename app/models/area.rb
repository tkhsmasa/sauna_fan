class Area < ApplicationRecord
  has_many :saunas, dependent: :destroy

end
