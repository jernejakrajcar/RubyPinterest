class Pin < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  belongs_to :board
  acts_as_commontable dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
end
