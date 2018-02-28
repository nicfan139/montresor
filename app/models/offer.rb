class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :user_id, presence: true
  validates :product_id, presence: true, uniqueness: {scope: :user_id}
  validates :description, length: { maximum: 500, message: "Description should be less than 500 characters" }
  validates :state, inclusion: { in: ["pending", "declined", "accepted"], message: "%{value} is not a valid value" }
  validates :price, format: { with: /\A\d*\z/, message: "Price only allows numbers" }
end
