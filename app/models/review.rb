class Review < ApplicationRecord
  belongs_to :user
  belongs_to :sauna
  has_many :comments, dependent: :destroy
end
