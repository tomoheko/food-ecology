class Order < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :building, :house_number, :phone_number, :product_id,:user_id, :token
  validates :token, presence: true

  with_options presence: true do
    validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number, length: { maximum: 11 }, format: {with: /\A\d{11}\z/, message: "is invalid. Input half-width characters."}
  end

  belongs_to :user
  belongs_to :product
  has_one    :address

  def save # 住所を保存
    order = Order.create(product_id: product_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number, order_id: order.id)
  end
end