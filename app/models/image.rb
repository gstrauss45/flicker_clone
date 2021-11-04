class Image < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  has_many :users
  has_many :comments
end
