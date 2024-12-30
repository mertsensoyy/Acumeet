class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  has_one_attached :image

  validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
