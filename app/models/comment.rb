class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :review

  def created_at_ymd
    created_at.strftime('%Y/%m/%d')
  end
  def updated_at_ymd
    updated_at.strftime('%Y/%m/%d')
  end
end
