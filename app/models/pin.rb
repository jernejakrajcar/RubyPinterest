class Pin < ApplicationRecord
  belongs_to :user
  belongs_to :board
  has_one_attached :image

  acts_as_commontable dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
end
