class Sauna < ApplicationRecord
  belongs_to :genre
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many_attached :sauna_images

  #バリテーション
  validates :name, presence: true
  validates :price, presence: true
  validates :is_active, inclusion: {in: [true, false]}
  validates :sales_state, inclusion: {in: [true, false]}
   #raty平均点
  # validates :rate, numericality: {
  #   less_than_or_equal_to: 5,
  #   greater_than_or_equal_to: 0.5}, presence: true

  #公開状況（公開）
  scope :is_active, -> { where(is_active: false) }

  #検索
  scope :search, -> (search_params) do
    if search_params.blank?
      all
    else
      name_like(search_params[:name])
        .address_like(search_params[:address])
        .genre_like(search_params[:genre])
    end
  end

    scope :name_like, -> (name) { where('saunas.name LIKE ?', "%#{name}%") if name.present? }
    scope :address_like, -> (address) { where('address1 LIKE ? or address2 LIKE ? or address3 LIKE ?', "%#{address}%", "%#{address}%", "%#{address}%") if address.present? }
    scope :genre_like, -> (genre) { where('genres.name LIKE ?', "%#{genre}%") if genre.present? }



  # デフォルト画像
  def get_sauna_images
    unless sauna_images.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      #byebug
      sauna_images.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    sauna_images[0]

  end

  # 税込価格
  def add_tax_price
    (price * 1.10).floor.to_s(:delimited) + '円'
  end

  # 住所 郵便番号+住所
  def address_display
    '〒' + postal_code + ' ' + address1+ ' ' + address2+ ' ' + address3
  end

  def full_address
    "%s %s %s"%([self.address1,self.address2,self.address3])
  end

  geocoded_by :full_address
  after_validation :geocode


  def bookmark_by?(user)
      bookmarks.exists?(user_id: user.id)
  end

  def created_at_ymd
    created_at.strftime('%Y/%m/%d')
  end


end
