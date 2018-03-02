class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :products, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_many :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true, format: { with: /\A[\w\s]+\z/, message: "only allows letters and whitespace" }
  validates :last_name, presence: true, format: { with: /\A[\w\s]+\z/, message: "only allows letters and whitespace" }
  validates :phone_number, presence: true, format: { with: /[\+\d]{9,}/, message: "should only contain digits and '+'" }
  validates :district, presence: true
end
