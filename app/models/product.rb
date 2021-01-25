class Product < ApplicationRecord
  # mount_uploader :image, ImageUploader

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipment_fee
  belongs_to_active_hash :shipment_term

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :image
    validates :quantity
    validates :explanation, length: { maximum: 300 }
  end

  # #ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :prefecture_id
    validates :shipment_term_id
    validates :shipment_fee_id
  end

  # priceの半角数字入力と数値の範囲指定
  validates :price, presence: true, format: { with: /\A-?[0-9]+(\.[0-9]+)?\z/, message: 'You must use half-width characters.' }, numericality: { only_integer: true, greater_than: 0 }

  # アソシエーション
  has_one_attached :image
  belongs_to :user
  has_one    :order
  has_many   :comments

  # 検索機能
  def self.search(search)
    if search != ""
      Product.where('text LIKE(?)', "%#{search}%")
    else
      Product.all
    end
  end
end
