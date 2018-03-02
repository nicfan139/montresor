class Comment < ApplicationRecord
  belongs_to :user

  validates :content, length: { minimum: 20, maximum: 500 }
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5] }
end
